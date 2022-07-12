<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1116Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form1116Data" select="$RtnDoc/IRS1116"/>
  <!-- /////////////////////////////////////////// (Template:  CreateTopSectionCheckbox) -->
  <xsl:template name="CreateTopSectionCheckbox">
    <xsl:param name="SpaceBefore">2mm</xsl:param>
    <xsl:param name="SpaceBetween">2mm</xsl:param>
    <xsl:param name="SpaceAfter">2mm</xsl:param>
    <xsl:param name="Number"/>
    <xsl:param name="Desc"/>
    <xsl:param name="TargetNode"/>
    <xsl:param name="BackupName"/>
    <div class="styIRS1116LNDesc" style="width:auto;height:100%;padding-left:0px;">
      <span>
        <xsl:attribute name="style">
          width:<xsl:value-of select="$SpaceBefore"/>;
        </xsl:attribute>
      </span> 
      <b>
        <xsl:value-of select="$Number"/>
      </b>
      <span>
        <xsl:attribute name="style">
          width:<xsl:value-of select="$SpaceBetween"/>;
        </xsl:attribute>
      </span>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$TargetNode"/>
          <xsl:with-param name="BackupName" select="$BackupName"/>
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$TargetNode"/>
          <xsl:with-param name="BackupName" select="$BackupName"/>
        </xsl:call-template>
        <span>
          <xsl:attribute name="style">
            width:<xsl:value-of select="$SpaceBetween"/>;
          </xsl:attribute>
        </span>
        <xsl:value-of select="$Desc"/>
        <span>
          <xsl:attribute name="style">
            width:<xsl:value-of select="$SpaceAfter"/>;
          </xsl:attribute>
        </span>
      </label>
    </div>
  </xsl:template>

  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <!-- /////////////////////////////////////////// (Template:              CreateBox) -->
  <xsl:template name="CreateBox">
    <xsl:param name="TargetNode"/>
    <xsl:param name="PopulateAsText"/>
    <xsl:param name="AmountBoxStyle"/>
    <xsl:param name="NumberBoxStyle"/>
    <xsl:param name="Number"/>
    <xsl:param name="Width">26mm</xsl:param>
    <xsl:param name="Height">5mm</xsl:param>
    <div class="styLNAmountBox">
    <xsl:if test="$Number!=12">
      <xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;
        height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
        <xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
        </xsl:if>
        <xsl:if test="$Number=12">
        <xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;
        height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
        <xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
        </xsl:if>
      <xsl:if test="$TargetNode">
        <xsl:if test="$TargetNode/@referenceDocumentId">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$TargetNode"/>
          </xsl:call-template>
        </xsl:if>
        <xsl:if test="$Number=12">
			<span>(</span>
			<xsl:call-template name="PopulateAmount">
			  <xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
			<span>)</span>
        </xsl:if>
        <xsl:if test="$Number!=12">
			<xsl:call-template name="PopulateAmount">
			  <xsl:with-param name="TargetNode" select="$TargetNode"/>
			</xsl:call-template>
        </xsl:if>
      </xsl:if>
    </div>
    <div class="styLNRightNumBox">
      <xsl:attribute name="style">
        float:right;
        padding:3px 0px 0px 0px;
        border-right-width:0px;
        <xsl:choose>
			<xsl:when test="$Number=12">
				height:<xsl:value-of select="$Height"/>;
			</xsl:when>
			<xsl:otherwise>
				height:<xsl:value-of select="$Height"/>;
			</xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$Number">
        <xsl:value-of select="$Number"/>
      </xsl:if>
    </div>
  </xsl:template>

  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <!-- /////////////////////////////////////////// (Template:              CreateBox) -->
  <xsl:template name="CreateBoxLine7">
    <xsl:param name="TargetNode"/>
    <xsl:param name="PopulateAsText"/>
    <xsl:param name="AmountBoxStyle"/>
    <xsl:param name="NumberBoxStyle"/>
    <xsl:param name="Number"/>
    <xsl:param name="Width">25mm</xsl:param>
    <xsl:param name="Height">5mm</xsl:param>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        width:25.25mm;
        height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
        <xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$TargetNode">
        <xsl:if test="$TargetNode/@referenceDocumentId">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$TargetNode"/>
          </xsl:call-template>
        </xsl:if>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TargetNode"/>
        </xsl:call-template>
      </xsl:if>
    </div>
    <div class="styLNRightNumBox">
      <xsl:attribute name="style">
        width:7.5mm;
        float:right;
        padding:3px 0px 0px 0px;
        border-right-width:0px;
        height:<xsl:value-of select="$Height"/>;
        <xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$Number">
        <xsl:value-of select="$Number"/>
      </xsl:if>
    </div>
  </xsl:template>



  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <!-- /////////////////////////////////////////// (Template:              CreateBoxText) -->
  <xsl:template name="CreateBoxText">
    <xsl:param name="TargetNode"/>
    <xsl:param name="PopulateAsText"/>
    <xsl:param name="AmountBoxStyle"/>
    <xsl:param name="NumberBoxStyle"/>
    <xsl:param name="Number"/>
    <xsl:param name="Width">26mm</xsl:param>
    <xsl:param name="Height">5mm</xsl:param>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;
        height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
        <xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$TargetNode">
        <xsl:if test="$TargetNode/@referenceDocumentId">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$TargetNode"/>
          </xsl:call-template>
        </xsl:if>
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$TargetNode"/>
        </xsl:call-template>
      </xsl:if>
    </div>
    <div class="styLNRightNumBox">
      <xsl:attribute name="style">
        float:right;
        padding:3px 0px 0px 0px;
        border-right-width:0px;
        height:<xsl:value-of select="$Height"/>;
        <xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$Number">
        <xsl:value-of select="$Number"/>
      </xsl:if>
    </div>
  </xsl:template>


  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <!-- /////////////////////////////////////////// (Template:  CreateDataRowPartI) -->
  <xsl:template name="CreateDataRowPartI">
    <xsl:param name="A"/>
    <xsl:param name="APopulateAsText"/>
    <xsl:param name="AStyle"/>
    <xsl:param name="B"/>
    <xsl:param name="BPopulateAsText"/>
    <xsl:param name="BStyle"/>
    <xsl:param name="C"/>
    <xsl:param name="CPopulateAsText"/>
    <xsl:param name="CStyle"/>
    <xsl:param name="TotalNumber"/>
    <xsl:param name="TotalNumberStyle"/>
    <xsl:param name="TotalContent"/>
    <xsl:param name="TotalContentStyle"/>
    <xsl:param name="Width">25mm</xsl:param>
    <xsl:param name="Height">5mm</xsl:param>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        background-color:green;
        width:26mm;
        height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
        <xsl:if test="$TotalContentStyle"><xsl:value-of select="$TotalContentStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$TotalContent">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$TotalContent"/>
        </xsl:call-template>
        <xsl:if test="$TotalContent/@referenceDocumentId">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$TotalContent"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:if>
    </div>
    <div class="styLNRightNumBox">
      <xsl:attribute name="style">
        float:right;
        padding:3px 0px 0px 0px;
        border-right-width:0px;
        height:<xsl:value-of select="$Height"/>;
        <xsl:if test="$TotalNumberStyle"><xsl:value-of select="$TotalNumberStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$TotalNumber">
        <xsl:value-of select="$TotalNumber"/>
      </xsl:if>
    </div>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
        <xsl:if test="$CStyle"><xsl:value-of select="$CStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$C">
        <xsl:choose>
          <xsl:when test="$CPopulateAsText">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$C"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$C"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$C/@referenceDocumentId">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$C"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:if>
    </div>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        background-color:red;
        width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
        <xsl:if test="$BStyle"><xsl:value-of select="$BStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$B">
        <xsl:choose>
          <xsl:when test="$BPopulateAsText">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$B"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$B"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$B/@referenceDocumentId">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$B"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:if>
    </div>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        background-color:orange;
        width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
        <xsl:if test="$AStyle"><xsl:value-of select="$AStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$A">
        <xsl:choose>
          <xsl:when test="$APopulateAsText">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$A"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$A"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="$A/@referenceDocumentId">
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$A"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:if>
    </div>
  </xsl:template>
  
  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <!-- /////////////////////////////////////////// (Template:  CreatePartITableTemplate)     -->
  <xsl:template name="CreatePartITableTemplate">

    <xsl:param name="ColA"/>
    <xsl:param name="ColALetter"/>
    <xsl:param name="ColB"/>
    <xsl:param name="ColBLetter"/>
    <xsl:param name="ColC"/>
    <xsl:param name="ColCLetter"/>
    
  <tr>
    <td class="styLNLeftNumBox"></td>
    <td class="styGenericDiv" style="width:70mm;"></td>
    <td class="styLNAmountBox" style="width:75mm;border-left-width:1px;font-weight:bold;text-align:center;" colspan="3">
      Foreign Country or U.S. Possession
    </td>
    <td class="styLNAmountBoxNBB" style="text-align:center;" colspan="2">
      <span class="styBoldText">Total</span>
    </td>
  </tr>
  <tr>
    <td class="styGenericDiv" style="width:8mm;font-weight:bold;">g</td>
    <td class="styGenericDiv" style="width:70mm;font-weight:bold;padding-bottom:0mm;">
      Enter the name of the foreign country or U.S.
    </td>
    <td class="styLNAmountBox" style="width:25mm;border-left-width:1px;font-weight:bold;text-align:center;">
      <xsl:value-of select="$ColALetter"/>
    </td>
    <td class="styLNAmountBox" style="width:25mm;font-weight:bold;text-align:center;">
      <xsl:value-of select="$ColBLetter"/>
    </td>
    <td class="styLNAmountBox" style="width:25mm;font-weight:bold;text-align:center;">
      <xsl:value-of select="$ColCLetter"/>
    </td>
    <td class="styLNAmountBox" style="width:33mm;text-align:center;font-size:6pt;padding-top:0mm;" colspan="2">
      (Add cols. A, B, and C.)
    </td>
  </tr>
  
  
  <tr>
    <td class="styLNLeftNumBox"></td>
    <td class="styGenericDiv" style="width:70mm;font-weight:bold;padding-top:0mm;padding-bottom:2mm;">
      possession
      <xsl:choose>
        <xsl:when test="$Form1116Data/ForeignRegulatedInvestmtCompCd">
          <xsl:call-template name="LinkToLeftoverDataTableInline">
            <xsl:with-param name="Desc">Foreign Regulated Investment Comp Code</xsl:with-param>
            <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignRegulatedInvestmtCompCd"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <span style="width:2mm;"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="$Form1116Data/ForeignIncHighTaxedKickOutCd">
          <xsl:call-template name="LinkToLeftoverDataTableInline">
            <xsl:with-param name="Desc">Foreign Income High Taxed Kickout Code</xsl:with-param>
            <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncHighTaxedKickOutCd"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <span style="width:2mm;"/>
        </xsl:otherwise>
      </xsl:choose>
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold;">..........</span>
      <span style="width:2mm;"></span>
      <img src="{$ImagePath}/1116_Bullet_Sm.gif" alt="SmallBullet"/>
    </td>
    <td class="styLNAmountBoxSmall" style="font-size:7pt;text-align:center;border-left-width:1px;">
      <xsl:choose>
          <xsl:when test="$ColA/ForeignTaxCrSplittingEventCd">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$ColA/ForeignTaxCrSplittingEventCd"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$ColA/ForeignCountryName"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
    </td>
    <td class="styLNAmountBoxSmall" style="font-size:7pt;text-align:center;">
      <xsl:choose>
          <xsl:when test="$ColB/ForeignTaxCrSplittingEventCd">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$ColB/ForeignTaxCrSplittingEventCd"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$ColB/ForeignCountryName"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
    </td>
    <td class="styLNAmountBoxSmall" style="font-size:7pt;text-align:center;">
      <xsl:choose>
          <xsl:when test="$ColC/ForeignTaxCrSplittingEventCd">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$ColC/ForeignTaxCrSplittingEventCd"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$ColC/ForeignCountryName"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>  

  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:2mm;">1a</td>
    <td class="styGenericDiv" style="width:70mm;">
      Gross income from sources within country shown
      above and of the type checked above (see
      instructions): <span style="width:48mm;border-bottom:1px dashed black;"> </span>
    </td>
    <td class="styLNAmountBoxSmallNBB" style="border-left-width:1px;background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNAmountBoxSmallNBB" style="background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNAmountBoxSmallNBB" style="background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>    
  </tr>
  
  <tr>
    <td class="styLNLeftNumBox" valign="top" style="padding-left:2mm;"></td>
    <td class="styGenericDiv" style="width:70mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom: 1px dashed black; border-left-width: 0px; border-right-width: 0px;">
      <xsl:call-template name="PopulateText">
       <xsl:with-param name="TargetNode" select="$Form1116Data/IncomeFromForeignSourceTypeCd"/>
      </xsl:call-template>      
      <xsl:call-template name="PopulateText">
       <xsl:with-param name="TargetNode" select="$Form1116Data/IncomeFromForeignSourceTxt"/>
      </xsl:call-template>      
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px;padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColA/ForeignGrossIncomeAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$ColB/ForeignGrossIncomeAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColC/ForeignGrossIncomeAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNRightNumBox">1a</td>
    <td class="styLNAmountBoxSmall">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$Form1116Data/TotalForeignGrossIncomeAmt"/>
      </xsl:call-template>      
    </td>    
  </tr>
  
  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:3.5mm;border-bottom:1 solid black;">b</td>
    <td class="styGenericDiv" style="width:70mm;border-bottom:1 solid black;">
      Check if line 1a is compensation for personal
      services as an employee, your total
      compensation from all sources is $250,000 or
      more, and you used an alternative basis to
      determine its source (see instructions)
         <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form1116Data/AltBasisCompensationSourceInd"/>
          </xsl:call-template>
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold;">........</span>
      <span style="width:2mm;"></span>
      <img src="{$ImagePath}/1116_Bullet_Sm.gif" alt="SmallBullet"/>
      <span style="width:2mm;"/>
      <input type="checkbox" class="styCkbox">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form1116Data/AltBasisCompensationSourceInd"/>
          <xsl:with-param name="BackupName" select="concat('Form1116DataAltBasisCompensationSourceInd', $ColALetter)"/>
        </xsl:call-template>
      </input>
      <label>
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form1116Data/AltBasisCompensationSourceInd"/>
          <xsl:with-param name="BackupName" select="concat('Form1116DataAltBasisCompensationSourceInd', $ColALetter)"/>
        </xsl:call-template>
      </label>      
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px;background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNAmountBoxSmall" style="background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNAmountBoxSmall" style="background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNRightNumBox" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>    
  </tr>
  
  <tr>
    <td class="styGenericDiv" style="width:78mm;" colspan="2">
      <span class="styBoldText">
        Deductions and losses
        <span class="styItalicText">
          (Caution:&#160;
        </span>
      </span> 
      <span class="styItalicText">
        See instructions):
      </span>       
    </td>
    <td class="styLNAmountBoxSmallNBB" style="border-left-width:1px;background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNAmountBoxSmallNBB" style="background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNAmountBoxSmallNBB" style="background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>    
  </tr>


  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:2mm;">2</td>
    <td class="styGenericDiv" style="width:70mm;">
      Expenses <span class="styBoldText">definitely related</span> to the income on line 1a (attach statement)
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">.........</span>
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px;padding-right:0px;">
      <xsl:call-template name="SetFormLinkInline">
       <xsl:with-param name="TargetNode" select="$ColA/ForeignIncRelatedExpensesAmt"/>
      </xsl:call-template>
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColA/ForeignIncRelatedExpensesAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="SetFormLinkInline">
       <xsl:with-param name="TargetNode" select="$ColB/ForeignIncRelatedExpensesAmt"/>
      </xsl:call-template>
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$ColB/ForeignIncRelatedExpensesAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="SetFormLinkInline">
       <xsl:with-param name="TargetNode" select="$ColC/ForeignIncRelatedExpensesAmt"/>
      </xsl:call-template>
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColC/ForeignIncRelatedExpensesAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>
      
  <tr>
    <td class="styGenericDiv" valign="top" style="padding-left:2mm;font-weight:bold">3</td>
    <td class="styGenericDiv" style="width:70mm;">
      Pro rata share of other deductions
      <span class="styBoldText">not definitely related:</span>
    </td>
    <td class="styLNAmountBoxSmallNBB" style="border-left-width:1px;background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNAmountBoxSmallNBB" style="background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNAmountBoxSmallNBB" style="background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>
        
  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:3.5mm;">a</td>
    <td class="styGenericDiv" style="width:70mm;">
      Certain itemized deductions or standard deduction (see instructions)
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">..........</span>
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px;padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColA/ItemizedOrStandardDeductionAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-left:0px; padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$ColB/ItemizedOrStandardDeductionAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColC/ItemizedOrStandardDeductionAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>

  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:3.5mm;">b</td>
    <td class="styGenericDiv" style="width:70mm;">
      Other deductions (attach statement)
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">....</span>
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px;padding-right:0px;">
      <xsl:call-template name="SetFormLinkInline">
       <xsl:with-param name="TargetNode" select="$ColA/OtherDeductionsNotRelatedAmt"/>
      </xsl:call-template>    
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColA/OtherDeductionsNotRelatedAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="SetFormLinkInline">
       <xsl:with-param name="TargetNode" select="$ColB/OtherDeductionsNotRelatedAmt"/>
      </xsl:call-template>
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$ColB/OtherDeductionsNotRelatedAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="SetFormLinkInline">
       <xsl:with-param name="TargetNode" select="$ColC/OtherDeductionsNotRelatedAmt"/>
      </xsl:call-template>
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColC/OtherDeductionsNotRelatedAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>

  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:3.5mm;">c</td>
    <td class="styGenericDiv" style="width:70mm;">
      Add lines 3a and 3b
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">..........</span>
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px;padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColA/TotalDeductionAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$ColB/TotalDeductionAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColC/TotalDeductionAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>

  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:3.5mm;">d</td>
    <td class="styGenericDiv" style="width:70mm;">
      Gross foreign source income (see instructions)
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">............</span>
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px; padding-right:0px; padding-left:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColA/GrossForeignSourceIncomeAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$ColB/GrossForeignSourceIncomeAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColC/GrossForeignSourceIncomeAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>

  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:3.5mm;">e</td>
    <td class="styGenericDiv" style="width:70mm;">
      Gross income from all sources (see instructions)
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px;padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColA/GrossIncomeAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$ColB/GrossIncomeAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColC/GrossIncomeAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>

  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:3.5mm;">f</td>
    <td class="styGenericDiv" style="width:70mm;">
      Divide line 3d by line 3e (see instructions)
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">..</span>
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px;padding-right:0px;">
      <xsl:call-template name="PopulateText">
       <xsl:with-param name="TargetNode" select="$ColA/ForeignIncomePct"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$ColB/ForeignIncomePct"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateText">
       <xsl:with-param name="TargetNode" select="$ColC/ForeignIncomePct"/>
      </xsl:call-template>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>

  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:3.5mm;">g</td>
    <td class="styGenericDiv" style="width:70mm;">
      Multiply line 3c by line 3f
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">........</span>
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px;padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColA/ProRataDeductionsNotRelatedAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$ColB/ProRataDeductionsNotRelatedAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColC/ProRataDeductionsNotRelatedAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>
      
  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:2mm;">4</td>
    <td class="styGenericDiv" style="width:70mm;ont-size:6.5pt;font-family:arial">
      Pro rata share of interest expense (see instructions):
    </td>
    <td class="styLNAmountBoxSmallNBB" style="border-left-width:1px;background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNAmountBoxSmallNBB" style="background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNAmountBoxSmallNBB" style="background-color:lightgrey">
      <span style="width:4mm;"></span>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>
        
  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:3.5mm;">a</td>
    <td class="styGenericDiv" style="width:70mm;">
      Home mortgage interest (use the Worksheet for Home Mortgage Interest in the instructions)
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">............</span>
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px;padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColA/ApportionedHomeMortgIntExpAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$ColB/ApportionedHomeMortgIntExpAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColC/ApportionedHomeMortgIntExpAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>

  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:3.5mm;">b</td>
    <td class="styGenericDiv" style="width:70mm;">
      Other interest expense
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">.........</span>
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px;padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColA/ApportionedOtherInterestExpAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$ColB/ApportionedOtherInterestExpAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColC/ApportionedOtherInterestExpAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>

  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:2mm;">5</td>
    <td class="styGenericDiv" style="width:70mm;">
      Losses from foreign sources
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">.......</span>
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px;padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColA/ForeignSourceLossAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$ColB/ForeignSourceLossAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColC/ForeignSourceLossAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNRightNumBoxNBB" style="background-color:lightgrey"><span style="width:4px"/></td>
    <td class="styLNAmountBoxSmallNBB"><span style="width:4px"/></td>
  </tr>

  <tr>
    <td class="styGenericDiv" valign="top" style="font-weight:bold;padding-left:2mm;border-bottom:1 solid black;">6</td>
    <td class="styGenericDiv" style="width:70mm;border-bottom:1 solid black;">
      Add lines 2, 3g, 4a, 4b, and 5
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">.......</span>
    </td>
    <td class="styLNAmountBoxSmall" style="border-left-width:1px;padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColA/ForeignIncNetDeductAndLossAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$ColB/ForeignIncNetDeductAndLossAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNAmountBoxSmall" style="padding-right:0px;">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$ColC/ForeignIncNetDeductAndLossAmt"/>
      </xsl:call-template>
    </td>
    <td class="styLNRightNumBox">6</td>
    <td class="styLNAmountBoxSmall">
      <xsl:call-template name="PopulateAmount">
       <xsl:with-param name="TargetNode" select="$Form1116Data/TotalDeductionOrLossAmt"/>
      </xsl:call-template>      
    </td>    
  </tr>






  </xsl:template>
  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <!-- /////////////////////////////////////////// (Template:  CreatePartIITableHeaders)     -->
  <xsl:template name="CreatePartIITableHeaders">
    <xsl:param name="AddColoredHeaders"/>
    <xsl:variable name="CommonStyle">border-color:black;font-size:6.5pt;text-align:center;font-family:arial</xsl:variable>
    <tr>
      <xsl:if test="$AddColoredHeaders">
        <xsl:attribute name="class">styDepTblHdr</xsl:attribute>
      </xsl:if>
      <!-- Country -->
      <th class="styIRS1116TableCell" scope="col" rowspan="4">
        <xsl:attribute name="style">width:4%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <img src="{$ImagePath}/1116_Country.gif" alt="CountryBullet"/>
      </th>
      <!-- Credit is claimed -->
      <th class="styIRS1116TableCell" scope="col" rowspan="3">
        <xsl:attribute name="style">width:12%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <b>Credit is claimed<br/>for taxes<br/>(you must check one)</b><br/>
        <div style="text-align:left;width:100%;height:auto;padding-left:7px;">
          <b>(h)</b><span style="width:5px;"/>
          <input type="checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxesPaidCreditInd"/>
              <xsl:with-param name="BackupName">Form1116DataForeignTaxesPaidCreditInd</xsl:with-param>
            </xsl:call-template>
          </input>
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxesPaidCreditInd"/>
              <xsl:with-param name="BackupName">Form1116DataForeignTaxesPaidCreditInd</xsl:with-param>
            </xsl:call-template>
            Paid
          </label><br/>
          <b>(i)</b><span style="width:8px;"/>
          <input type="checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxesAccruedCreditInd"/>
              <xsl:with-param name="BackupName">Form1116DataForeignTaxesAccruedCreditInd</xsl:with-param>
            </xsl:call-template>
          </input>
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxesAccruedCreditInd"/>
              <xsl:with-param name="BackupName">Form1116DataForeignTaxesAccruedCreditInd</xsl:with-param>
            </xsl:call-template>
            Accrued
          </label>
        </div>
      </th>
      <!-- Foreign taxes -->
      <th class="styIRS1116TableCell" scope="col" rowspan="1" colspan="9">
        <xsl:attribute name="style">width:84%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <b>Foreign taxes paid or accrued</b>    
      </th>
    </tr>
    <tr>
      <xsl:if test="$AddColoredHeaders">
        <xsl:attribute name="class">styDepTblHdr</xsl:attribute>
      </xsl:if>
      <!-- In foreign currency -->
      <th class="styIRS1116TableCell" scope="col" colspan="4">
        <xsl:attribute name="style">width:37%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        In foreign currency    
      </th>
      <!-- In U.S. dollars -->
      <th class="styIRS1116TableCell" scope="col" colspan="5">
        <xsl:attribute name="style">width:47%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        In U.S. dollars
      </th>
    </tr>
    <tr>
      <xsl:if test="$AddColoredHeaders">
        <xsl:attribute name="class">styDepTblHdr</xsl:attribute>
      </xsl:if>
      <!-- Taxes withheld at source on -->
      <th class="styIRS1116TableCell" scope="col" colspan="3">
        <xsl:attribute name="style">width:30%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        Taxes withheld at source on:
      </th>
      <!-- Other foreign -->
      <th class="styIRS1116TableCell" scope="col" rowspan="2">
        <xsl:attribute name="style">width:7%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <b>(n) </b>Other foreign taxes paid or accrued
      </th>
      <!-- Taxes withheld at source on -->
      <th class="styIRS1116TableCell" scope="col" colspan="3">
        <xsl:attribute name="style">width:27%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        Taxes withheld at source on:
      </th>
      <!-- Other foreign -->
      <th class="styIRS1116TableCell" scope="col" rowspan="2">
        <xsl:attribute name="style">width:10%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <b>(r)</b> Other<br/>foreign taxes<br/>paid or<br/>accrued
      </th>
      <!-- Total foreign -->
      <th class="styIRS1116TableCell" scope="col" rowspan="2">
        <xsl:attribute name="style">width:10%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <b>(s)</b> Total foreign<br/>taxes paid or<br/>accrued (add cols.<br/>(o) through (r))
      </th>
    </tr>
    <tr>
      <xsl:if test="$AddColoredHeaders">
        <xsl:attribute name="class">styDepTblHdr</xsl:attribute>
      </xsl:if>
      <!-- Date paid -->
      <th class="styIRS1116TableCell" scope="col">
        <xsl:attribute name="style">width:12%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <b>(j)</b> Date paid<br/>or accrued
      </th>
      <!-- Dividends -->
      <th class="styIRS1116TableCell" scope="col">
        <xsl:attribute name="style">width:10%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <b>(k)</b> Dividends
      </th>
      <!-- Rents and royalties -->
      <th class="styIRS1116TableCell" scope="col">
        <xsl:attribute name="style">width:10%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <b>(l)</b> Rents<br/>and royalties
      </th>
      <!-- Interest -->
      <th class="styIRS1116TableCell" scope="col">
        <xsl:attribute name="style">width:10%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <b>(m)</b> Interest
      </th>
      <!-- Dividends -->
      <th class="styIRS1116TableCell" scope="col">
        <xsl:attribute name="style">width:10%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <b>(o)</b> Dividends
      </th>
      <!-- Rents -->
      <th class="styIRS1116TableCell" scope="col">
        <xsl:attribute name="style">width:10%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <b>(p)</b> Rents<br/>and royalties
      </th>
      <!-- Interest -->
      <th class="styIRS1116TableCell" scope="col">
        <xsl:attribute name="style">width:7%;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
        <b>(q)</b> Interest
      </th>
    </tr>
  </xsl:template>
  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <!-- /////////////////////////////////////////// (Template:  CreatePartIITableRows)         -->
  <xsl:template name="CreatePartIITableRows">
    <xsl:param name="AddColorCodeRow"/>
    <xsl:param name="RowLetter"/>
    <!-- IsLast -->
    <xsl:variable name="IsLast">
      <xsl:if test="(position() &gt; 3) and (position() = last())">
        border-bottom-width:0px;
      </xsl:if>
    </xsl:variable>
    <!-- ClassType -->
    <xsl:variable name="ClassType">
      <xsl:choose>
        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!-- CommonStyle -->
    <xsl:variable name="CommonStyle">font-size: 8pt; text-align:center;font-family:arial narrow;word-wrap:break-word;</xsl:variable>
    <tr style="font-size: 7pt;">
      <xsl:if test="$AddColorCodeRow">
        <xsl:attribute name="class"><xsl:value-of select="$ClassType"/></xsl:attribute>
      </xsl:if>
      <!-- Country  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell">
        <xsl:attribute name="style">
          width:4%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>
        </xsl:attribute>
        <b><xsl:value-of select="$RowLetter"/></b>
      </td>
      <!-- (J)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell">
        <xsl:attribute name="style">
          width:12%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>
        </xsl:attribute>
        <xsl:choose>
          <xsl:when test="ForeignTaxesPaidOrAccruedDt">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="ForeignTaxesPaidOrAccruedDt"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="ForeignTaxSpecialTypeCd"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </td>
      <!-- (K)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell" nowrap="true">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="ForeignTaxWithheldOnDivAmt"/>
        </xsl:call-template>
         <xsl:if test="ForeignTaxWithheldOnDivAmt/@referenceDocumentId">
            <br/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="ForeignTaxWithheldOnDivAmt"/>
            </xsl:call-template>
          </xsl:if>
      </td>
      <!-- (L)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell" nowrap="true">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="ForeignTaxWithheldOnRentAmt"/>
        </xsl:call-template>
		<xsl:if test="ForeignTaxWithheldOnRentAmt/@referenceDocumentId">
			<br/>
			<xsl:call-template name="SetFormLinkInline">
				 <xsl:with-param name="TargetNode" select="ForeignTaxWithheldOnRentAmt"/>
			</xsl:call-template>
		</xsl:if>
      </td>
      <!-- (M)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell" nowrap="true">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="ForeignTaxWithheldOnIntAmt"/>
        </xsl:call-template>
        <xsl:if test="ForeignTaxWithheldOnIntAmt/@referenceDocumentId">
			<br/>
			<xsl:call-template name="SetFormLinkInline">
				 <xsl:with-param name="TargetNode" select="ForeignTaxWithheldOnIntAmt"/>
			</xsl:call-template>
		</xsl:if>
      </td>
      <!-- (N)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell" nowrap="true">
        <xsl:attribute name="style">
          width:7%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <xsl:if test="OtherCurrencyTaxPaidAmt">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="OtherCurrencyTaxPaidAmt"/>
          </xsl:call-template>
          <xsl:if test="OtherCurrencyTaxPaidAmt/@referenceDocumentId">
            <br/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="OtherCurrencyTaxPaidAmt"/>
            </xsl:call-template>
          </xsl:if>
        </xsl:if>
      </td>
      <!-- (O)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell" nowrap="true">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="USTaxWithheldOnDividendAmt"/>
        </xsl:call-template>
      </td>
      <!-- (P)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell" nowrap="true">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="USTaxWithheldOnRentAmt"/>
        </xsl:call-template>
      </td>
      <!-- (Q)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell" nowrap="true">
        <xsl:attribute name="style">
          width:7%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="USTaxWithheldOnInterestAmt"/>
        </xsl:call-template>
      </td>
      <!-- (R)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell" nowrap="true">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="USDollarOtherForeignTaxPaidAmt"/>
        </xsl:call-template>
      </td>
      <!-- (S)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell" nowrap="true">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="TotalForeignTaxPaidOrAccrAmt"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <!-- /////////////////////////////////////////// (Template:  CreatePartIIEmptyTableRows)-->
  <xsl:template name="CreatePartIIEmptyTableRows">
    <xsl:param name="InsertAdditionalDataMessage"/>
    <xsl:param name="RowLetter"/>
    <!-- IsLast -->
    <xsl:variable name="IsLast">
      <xsl:if test="(position() &gt; 3) and (position() = last())">
        border-bottom-width:0px;
      </xsl:if>
    </xsl:variable>
    <!-- CommonStyle -->
    <xsl:variable name="CommonStyle">font-size: 8pt; text-align:center;font-family:arial narrow;word-wrap:break-word;</xsl:variable>
    <tr>
      <!-- Country  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell">
        <xsl:attribute name="style">
          width:4%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>
        </xsl:attribute>
        <b><xsl:value-of select="$RowLetter"/></b>
      </td>
      <!-- (J)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell">
        <xsl:attribute name="style">
          width:12%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>
        </xsl:attribute>
        <span style="width:4px"/>
        <xsl:if test="$InsertAdditionalDataMessage">
          <xsl:if test="((count($Form1116Data/ForeignTaxCreditSource) &gt;3) and ($Print = $Separated))">
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxCreditSource"/>
            </xsl:call-template>
          </xsl:if>
        </xsl:if>
      </td>
      <!-- (K)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <span style="width:4px"/>
      </td>
      <!-- (L)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <span style="width:4px"/>
      </td>
      <!-- (M)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <span style="width:4px"/>
      </td>
      <!-- (N)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell">
        <xsl:attribute name="style">
          width:7%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <span style="width:4px"/>
      </td>
      <!-- (O)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <span style="width:4px"/>
      </td>
      <!-- (P)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <span style="width:4px"/>
      </td>
      <!-- (Q)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell">
        <xsl:attribute name="style">
          width:7%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <span style="width:4px"/>
      </td>
      <!-- (R)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <span style="width:4px"/>
      </td>
      <!-- (S)  ++++++++++++++++++++ -->
      <td class="styIRS1116TableCell">
        <xsl:attribute name="style">
          width:10%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/>font-size:6pt;
        </xsl:attribute>
        <span style="width:4px"/>
      </td>
    </tr>
  </xsl:template>
  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <xsl:template match="/">
    <html lang="EN-US">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1116Data)"/>
          </xsl:call-template>
        </title>
        <!--  No Browser Caching  -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set  -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 1116"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1116Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="IRS1116">
          <!--  Begin Header section 1 -->
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:187mm;border-bottom-width:2px;">
            <div class="styFNBox" style="width:31mm;height:22.1mm;border-right-width:2px;padding-top:.5mm;">
              <div style="padding-top:1mm;">
                Form<span class="styFormNumber">  1116</span>
              </div>
              <!--General Dependency Push Pin-->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1116Data"/>
              </xsl:call-template>
              <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Alternative Minimum Tax Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/AlternativeMinimumTaxCd"/>
              </xsl:call-template>
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service (99)</span>
            </div>
            <div class="styFTBox" style="width:125mm;">
              <!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
              <div class="styMainTitle" style="height:8mm;">
                Foreign Tax Credit<br/>
                <span class="styNormalText" style="font-size:8pt;">
                  <span class="styBoldText">(Individual, Estate, or Trust)</span>
                  <br/>
                </span>
              </div>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:0mm;margin-top:1px;text-align:center;">
                <span style="text-align:center;font-weight:bold;">
                  <div style="width:100%;height:5mm;padding-left:0px;">
                    <div style="width:100mm;height:5mm;">
                      <img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallBullet"/> 
                      Attach to Form 1040, 1040NR, 1041, or 990-T.<br/>
                      <img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallBullet"/> 
                      Information about Form 1116 and its separate instructions is at<br />
                      <i>www.irs.gov/form1116</i>.
                    </div>
                  </div>
                </span>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;border-left-width:2px;height:22.1mm;">
              <div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0121</div>
              <div class="styTY">20<span class="styTYColor">12</span>
              </div>
              <div style="margin-left:3mm;text-align:left;font-size:7pt;">
                Attachment<br/>Sequence No. 
                <span class="styBoldText" style="font-size:9pt;">19</span>
              </div>
            </div>
          </div>
          <!--  End Header section 1 -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:108mm;height:8mm;font-weight:normal;font-size:7pt;">
              Name<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">Name</xsl:with-param>
              </xsl:call-template>
            </div>
            <div style="width:79mm;height:4mm;padding-left:2mm;font-size:7pt;" class="styEINBox">
              Identifying number <span class="styNormalText">as shown on page 1 of your tax return</span>
              <br/>
              <span style="font-weight:normal;text-align:center;width:100%">
                <xsl:call-template name="PopulateSSN">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
                  <xsl:with-param name="BackupName">RtnHdrDataFilerPrimarySSN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- End Names and Identifying number section -->
          <!-- Begin Top Section -->
          <div class="styBB" style="width:187mm;">
            <!-- Description -->
            <div class="styIRS1116LineItem">
              <span style="height:100%;padding-bottom:7px;">
                Use a separate Form 1116 for each category of income listed below. See <b>Categories of Income</b> in the instructions. Check only one box on<br/>
                each Form 1116. Report all amounts in U.S. dollars except where specified in Part II below.<br/>
              </span>
            </div>
            <!-- 1st line of checkboxes -->
            <div class="styIRS1116LineItem">
              <!-- (a) Passive category income checkbox -->
              <div class="styIRS1116LNDesc" style="padding:0px 0px 0px 0px;height:100%;width:33%">
                <xsl:call-template name="CreateTopSectionCheckbox">
                  <xsl:with-param name="SpaceBefore">2px</xsl:with-param>
                  <xsl:with-param name="Number">a</xsl:with-param>
                  <xsl:with-param name="Desc">Passive category income</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncPassiveCategoryInd"/>
                  <xsl:with-param name="BackupName">Form1116DataForeignIncPassiveCategoryInd</xsl:with-param>
                </xsl:call-template>
              </div>
              <!-- (c) Section 901(j) income checkbox -->
              <div class="styIRS1116LNDesc" style="padding:0px 0px 0px 0px;height:100%;width:33%">
                <xsl:call-template name="CreateTopSectionCheckbox">
                  <xsl:with-param name="Number">c</xsl:with-param>
                  <xsl:with-param name="Desc">Section 901(j) income</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncSection901jInd"/>
                  <xsl:with-param name="BackupName">Form1116DataForeignIncSection901jInd</xsl:with-param>
                </xsl:call-template>
              </div>
              <!-- (e) Lump-sum distributions checkbox -->
              <div class="styIRS1116LNDesc" style="padding:0px 0px 0px 0px;height:100%;width:33.9%">
                <xsl:call-template name="CreateTopSectionCheckbox">
                  <xsl:with-param name="Number">e</xsl:with-param>
                  <xsl:with-param name="Desc">Lump-sum distributions</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncLumpSumDistribInd"/>
                  <xsl:with-param name="BackupName">Form1116DataForeignIncLumpSumDistribInd</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- 2nd line of checkboxes -->
            <div class="styIRS1116LineItem">
              <!-- (b) General category income checkbox -->
              <div class="styIRS1116LNDesc" style="padding:0px 0px 0px 0px;height:100%;width:33%">
                <xsl:call-template name="CreateTopSectionCheckbox">
                  <xsl:with-param name="SpaceBefore">2px</xsl:with-param>
                  <xsl:with-param name="Number">b</xsl:with-param>
                  <xsl:with-param name="Desc">General category income</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncGeneralCategoryInd"/>
                  <xsl:with-param name="BackupName">Form1116DataForeignIncGeneralCategoryInd</xsl:with-param>
                </xsl:call-template>
              </div>
              <!-- (d) Certain income re-sourced by treaty checkbox -->
              <div class="styIRS1116LNDesc" style="padding:0px 0px 0px 0px;height:100%;width:66.9%">
                <xsl:call-template name="CreateTopSectionCheckbox">
                  <xsl:with-param name="Number">d</xsl:with-param>
                  <xsl:with-param name="Desc">Certain income re-sourced by treaty</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncResourcedTreatyInd"/>
                  <xsl:with-param name="BackupName">Form1116DataForeignIncResourcedTreatyInd</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <br/>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="padding-left:2px;text-align:left;width:auto;">f</div>
              <div class="styIRS1116LNDesc" style="width:25%;height:100%;">
                Resident of (name of country)
                <img src="{$ImagePath}/1116_Bullet_Sm.gif" alt="SmallBullet"/>
              </div>
              <div class="styIRS1116LNDesc" style="width:72%;height:100%;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ResidenceForeignCountryNm"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <span style="padding-bottom:3px;height:100%">
              <b>Note:</b>
              <span class="styItalicText"> If you paid taxes to only one foreign country or U.S. possession, use column A in Part I and line A in Part II. If you paid taxes to<br/>
                <b>more than one</b> foreign country or U.S. possession, use a separate column and line for each country or possession.</span>
            </span>
          </div>
          <!-- End Top Section -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!--  Begin PART I -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Header -->
          <div style="width:187mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part I</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Taxable Income or Loss From Sources Outside the United States (for Category Checked Above)
            </div>
          </div>
          <!-- Body -->
          <!-- Table starts here -->
          <!-- Retrevie all ForeignTaxCreditSource elements -->
          <table class="styTable" cellspacing="0" style="width:187mm;font-size:7pt;">
            <xsl:variable name="AllForeign" select="$Form1116Data/*[starts-with(name(), 'ForeignTaxCreditSource')]"/>
            <xsl:choose>
              <xsl:when test="count($Form1116Data/ForeignTaxCreditSource) > 0">
                <!-- Loop over all ForeignTaxCreditSource elements but jumps every 3 (so 1, 4, 7, ...) -->
                <xsl:for-each select="$AllForeign[position() mod 3 = 1]">
                  <xsl:call-template name="CreatePartITableTemplate">
                    <xsl:with-param name="ColA" select="."/>
                    <xsl:with-param name="ColALetter">
                      <xsl:number format="A"/>
                    </xsl:with-param>
                    <xsl:with-param name="ColB" select="following-sibling::*[1]"/>
                    <xsl:with-param name="ColBLetter">
                      <xsl:number format="B"/>
                    </xsl:with-param>
                    <xsl:with-param name="ColC" select="following-sibling::*[2]"/>
                    <xsl:with-param name="ColCLetter">
                      <xsl:number format="C"/>
                    </xsl:with-param>
                  </xsl:call-template>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="CreatePartITableTemplate">
                  <xsl:with-param name="ColALetter">A</xsl:with-param>
                  <xsl:with-param name="ColA" select="$Form1116Data/ForeignTaxCreditSource[1]"/>
                  <xsl:with-param name="ColBLetter">B</xsl:with-param>
                  <xsl:with-param name="ColB" select="$Form1116Data/ForeignTaxCreditSource[2]"/>
                  <xsl:with-param name="ColCLetter">C</xsl:with-param>
                  <xsl:with-param name="ColC" select="$Form1116Data/ForeignTaxCreditSource[3]"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </table>
          <div class="styBB" style="width:187mm;height:4.5mm;">
            <!-- (7) ////////////////////////////////////////////////////////////////////// -->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;height:4.5mm;width:7mm;padding-left:2mm;">7</div>
              <div class="styIRS1116LNDesc" style="width:auto;padding-left:2mm;height:4.5mm;">
                Subtract line 6 from line 1a. Enter the result here and on line 15, page 2
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:5px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.       
                  <img src="{$ImagePath}/1116_Bullet_Sm.gif" alt="SmallBullet" />                 
                </span>
              </div>
              <xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">7</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;width:25.6mm;padding-right:.2mm;height:4.5mm;margin-left:-.02mm;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;width:7.8mm;height:4.5mm;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/NetForeignTaxableIncomeLossAmt"/>
                <xsl:with-param name="Width">18mm;</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!--  Begin PART II -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part II</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Foreign Taxes Paid or Accrued <span class="styNormalText">(see instructions)</span>
            </div>
          </div>
          <!-- Body -->
          <div style="width:187mm;" class="styTBB">
            <!-- (Table) //////////////////////////////////////////////////////////////// -->
            <div class="styIRS1116LineItem">
              <div class="styGenericDiv" style="width:3.2mm;float:right;">
                <!-- button display logic -->
                <xsl:call-template name="SetDynamicTableToggleButton">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxCreditSource"/>
                  <xsl:with-param name="containerHeight" select="3"/>
                  <xsl:with-param name="containerID" select=" 'ForeignTaxCreditSourceDiv' "/>
                  <xsl:with-param name="headerRowCount" select="4"/>
                </xsl:call-template>
                <!-- end button display logic -->
              </div>
              <div class="styTableContainer" id="ForeignTaxCreditSourceDiv">
                <xsl:call-template name="SetInitialState"/>
                <table class="styTable" cellspacing="0">
                  <thead class="styTableThead">
                    <xsl:call-template name="CreatePartIITableHeaders"/>
                  </thead>
                  <tfoot/>
                  <tbody>
                    <xsl:for-each select="$Form1116Data/ForeignTaxCreditSource">
                      <!--JMI: If the print parameter is not set to be Separated, or there are less elements than the-->
                      <!--container height (4), execute-->
                      <xsl:variable name="Letter"><xsl:number format="A"/></xsl:variable>
                      <xsl:if test="($Print != $Separated) or (count($Form1116Data/ForeignTaxCreditSource) &lt;=3)">
                        <xsl:call-template name="CreatePartIITableRows">
                          <xsl:with-param name="RowLetter"><xsl:value-of select="$Letter"/></xsl:with-param>
                        </xsl:call-template>
                      </xsl:if>
                    </xsl:for-each>
                    <!-- Table Filler Rows -->
                    <!-- JMI: added: or.... -->
                    <xsl:if test="count($Form1116Data/ForeignTaxCreditSource) &lt; 1 or ((count($Form1116Data/ForeignTaxCreditSource) &gt;3) and ($Print = $Separated))">
                      <xsl:call-template name="CreatePartIIEmptyTableRows">
                        <xsl:with-param name="RowLetter">A</xsl:with-param>
                        <xsl:with-param name="InsertAdditionalDataMessage">true</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <!-- JMI: added: or.... -->
                    <xsl:if test="count($Form1116Data/ForeignTaxCreditSource) &lt; 2 or ((count($Form1116Data/ForeignTaxCreditSource) &gt;3) and ($Print = $Separated))">
                      <xsl:call-template name="CreatePartIIEmptyTableRows">
                        <xsl:with-param name="RowLetter">B</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <!-- JMI: added: or.... -->
                    <xsl:if test="count($Form1116Data/ForeignTaxCreditSource) &lt; 3 or ((count($Form1116Data/ForeignTaxCreditSource) &gt;3) and ($Print = $Separated))">
                      <xsl:call-template name="CreatePartIIEmptyTableRows">
                        <xsl:with-param name="RowLetter">C</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </tbody>
                </table>
              </div>
              <!-- Set Initial Height of Above Table -->
              <xsl:call-template name="SetInitialDynamicTableHeight">
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxCreditSource"/>
                <xsl:with-param name="containerHeight" select="3"/>
                <xsl:with-param name="headerRowCount" select="4"/>
                <xsl:with-param name="containerID" select=" 'ForeignTaxCreditSourceDiv' "/>
              </xsl:call-template>
              <!-- End Set Initial Height of Above Table -->
            </div>
            <!-- (8) ////////////////////////////////////////////////////////////////////// -->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;">8</div>
              <div class="styIRS1116LNDesc" style="width:auto;padding-left:0px;height:100%;">
                <b>Add lines A through C, column (s). Enter the total here and on line 9, page 2</b>
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>.
                  <span style="width:11px"/>
                  <img src="{$ImagePath}/1116_Bullet_Sm.gif" alt="SmallBullet"/>
                </span>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Number">8</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">width:25.3mm;border-bottom-width:0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">width:7.6mm;border-bottom-width:0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/TotalForeignTaxPaidOrAccrAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;">
              <span class="styBoldText">
                For Paperwork Reduction Act Notice, see instructions.
              </span>
            </div>
            <div style="float:right;">
              <span style="width:50px;"/>  
                Form 
              <span class="styBoldText" style="font-size:8pt;">1116</span> (2012)
            </div>
            <div style="float:right;text-align:center;width:26mm;font-size:7pt;">
              Cat. No. 11440U
            </div>
          </div>
          <!-- END Page Break and Footer-->
          <!-- BEGIN Page Header -->
          <div class="styTBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">
              Form 1116 (2012)
            </div>
            <div style="float:right;">
              Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
          <!-- END Page Header -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!--  Begin PART III -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part III</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Figuring the Credit
            </div>
          </div>
          <!-- Body -->
          <div style="width:187mm;" class="styBB">
            <!-- (9) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;">9</div>
              <div class="styIRS1116LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Enter the amount from line 8. These are your total foreign taxes paid<br/>
                  or accrued for the category of income checked above Part I
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:69mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="Height">3.5mm</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="Height">3.5mm</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/TotalForeignTaxPaidOrAccrAmt"/>
                  <xsl:with-param name="Number">9</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (10) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">4mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">4mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">10</div>
              <div class="styIRS1116LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Carryback or carryover (attach detailed computation)
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:6px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:69mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxCrCarrybackOrOverAmt"/>
                  <xsl:with-param name="Number">10</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (11) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">4mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">4mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">11</div>
              <div class="styIRS1116LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Add lines 9 and 10
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:8px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:69mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignGrossTaxPaidOrAccrAmt"/>
                  <xsl:with-param name="Number">11</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (12) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">4mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">4mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;padding-top:4mm">12</div>
              <div class="styIRS1116LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;padding-top:4mm">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Reduction in foreign taxes (see instructions)
                   <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:8px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:8px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:69mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;height:100%</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;height:100%</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxReductionAmt"/>
                  <xsl:with-param name="AmountBoxStyle">height:100%;padding-top:4mm</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">height:100%;padding-top:6mm</xsl:with-param>
                  <xsl:with-param name="Number">12</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (13) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">4mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">4mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">13</div>
              <div class="styIRS1116LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Taxes reclassified under high tax kickout (see instructions)
                   <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:8px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:69mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncHighTaxKickOutAdjAmt"/>
                  <xsl:with-param name="Number">13</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (14) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="Height">4mm</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">14</div>
              <div class="styIRS1116LNDesc" style="width:145mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Combine lines 11, 12, and 13. This is the total amount of foreign taxes available for credit
                  <xsl:if test="$Form1116Data/ForeignTaxAvailForCrReductAmt/@foreignIncHighTaxKickOutAdjAmt">
                    <span style="width:5px;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Foreign Income High Tax Kick Out Adjustment Amount</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxAvailForCrReductAmt/@foreignIncHighTaxKickOutAdjAmt"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="$Form1116Data/ForeignTaxAvailForCrReductAmt/@foreignIncHighTaxKickOutAdjCd">
                    <span style="width:5px;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Foreign Income High Tax Kick Out Adjustment Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxAvailForCrReductAmt/@foreignIncHighTaxKickOutAdjCd"/>
                    </xsl:call-template>
                  </xsl:if>
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:6px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.                    
                    <xsl:if test="not($Form1116Data/ForeignTaxAvailForCrReductAmt/@foreignIncHighTaxKickOutAdjCd)">
                      <span style="width:11px"/>.
                    </xsl:if>
                    <xsl:if test="not($Form1116Data/ForeignTaxAvailForCrReductAmt/@foreignIncHighTaxKickOutAdjAmt)">
                      <span style="width:11px"/>.
                    </xsl:if>
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:34mm;float:right;padding:0px 0px 0px 0px;">
                
                <xsl:call-template name="CreateBox">
					<xsl:with-param name="Number">14</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxAvailForCrReductAmt"/>
                  
                </xsl:call-template>
              </div>
            </div>
            <!-- (15) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">15</div>
              <div class="styIRS1116LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Enter the amount from line 7. This is your taxable income or (loss) from<br/>
                  sources outside the United States (before adjustments) for the category<br/>
                  of income checked above Part I (see instructions)
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:7px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:69mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="Height">6.5mm</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="Height">6.5mm</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxableIncomeOrLossAmt"/>
                  <xsl:with-param name="Number">15</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (16) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">16</div>
              <div class="styIRS1116LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                    Adjustments to line 15 (see instructions)
                  </div>
                  <div class="styIRS1116LNDesc" style="width:auto;height:100%;float:right;padding-right:6px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:69mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncomeNetAdjustmentAmt"/>
                  <xsl:with-param name="Number">16</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (17) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">17</div>
              <div class="styIRS1116LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Combine the amounts on lines 15 and 16. This is your net foreign<br/>
                  source taxable income. (If the result is zero or less, you have no<br/>
                  foreign tax credit for the category of income you checked above<br/>
                  Part I. Skip lines 18 through 22. However, if you are filing more than<br/>
                  one Form 1116, you must complete line 20.)
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:17px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:69mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="Height">13mm</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="Height">13mm</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignNetTaxableIncomeAmt"/>
                  <xsl:with-param name="Number">17</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (18) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">18</div>
              <div class="styIRS1116LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  <b>Individuals:</b> Enter the amount from Form 1040, line 41, or Form<br/>
                  1040NR, line 39. <b>Estates and trusts:</b> Enter your taxable income<br/>
                  without the deduction for your exemption
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:4px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:69mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="Height">6.5mm</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="Height">6.5mm</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxableIncBfExemptAmt"/>
                  <xsl:with-param name="Number">18</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;"/>
              <div class="styIRS1116LNDesc" style="width:145mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  <b>Caution:</b><span style="width:4px;"/><span class="styItalicText">If you figured your tax using the lower rates on qualified dividends or capital gains, see<br/>
                  page 17 of the instructions.</span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:34mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="Height">3.5mm</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (19) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">19</div>
              <div class="styIRS1116LNDesc" style="width:145mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Divide line 17 by line 18. If line 17 is more than line 18, enter "1"
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:14px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:34mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBoxText">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxableIncBfExemptRt"/>
                  <xsl:with-param name="Number">19</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (20) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">20</div>
              <div class="styIRS1116LNDesc" style="width:145mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  <b>Individuals:</b> Enter the amount from Form 1040, line 44. If you are a nonresident alien, enter the amount from Form 1040NR, line 42. <b> Estates and trusts:</b> Enter the amount from Form 1041, Schedule G,<br/>
                   line 1a, or the total of Form 990-T, lines 36 and 37
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:6px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:34mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="Height">6.5mm</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/TaxFromTaxReturnAmt"/>
                  <xsl:with-param name="Number">20</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;"/>
              <div class="styIRS1116LNDesc" style="width:145mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  <b>Caution:</b><span style="width:4px;"/><span class="styItalicText">If you are completing line 20 for separate category <span class="styBoldText">e</span> (lump-sum distributions), see instructions.</span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:34mm;float:right;padding:0px 0px 0px 0px;">
                
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (21) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">21</div>
              <div class="styIRS1116LNDesc" style="width:145mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Multiply line 20 by line 19 (maximum amount of credit)
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:17px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:34mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/MaxAllowedForeignTaxCreditAmt"/>
                  <xsl:with-param name="Number">21</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (22) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">22</div>
              <div class="styIRS1116LNDesc" style="width:145mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Enter the <b>smaller</b> of line 14 or line 21. If this is the only Form 1116 you are filing, skip lines 23<br/>
                  through 27 and enter this amount on line 28. Otherwise, complete the appropriate line in Part IV<br/>
                  (see instructions)
                  <xsl:if test="$Form1116Data/GrossForeignTaxCreditAmt/@foreignIncomeLumpSumDistribCd">
                    <span style="width:4px;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Foreign Income Lump Sum Distribution Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$Form1116Data/GrossForeignTaxCreditAmt/@foreignIncomeLumpSumDistribCd"/>
                    </xsl:call-template>
                  </xsl:if>
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:2px"/>
                    <span style="width:15px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <xsl:if test="not($Form1116Data/GrossForeignTaxCreditAmt/@foreignIncomeLumpSumDistribCd)">
                      <span style="width:11px"/>.
                    </xsl:if>
                    <span style="width:5px"/>
                    <img src="{$ImagePath}/1116_Bullet_Sm.gif" alt="SmallBullet"/>
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:34mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="Height">6.5mm</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/GrossForeignTaxCreditAmt"/>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="Number">22</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!--  Begin PART IV -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part IV</div>
            <div class="styPartDesc" style="padding-left:3mm;">
              Summary of Credits From Separate Parts III <span class="styNormalText">(see instructions)</span>
            </div>
          </div>
          <!-- Body -->
          <div style="width:187mm;" class="styBB">
            <!-- (23) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">23</div>
              <div class="styIRS1116LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Credit for taxes on passive category income
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:5px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:69mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignPassiveIncTaxCreditAmt"/>
                  <xsl:with-param name="Number">23</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (24) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">24</div>
              <div class="styIRS1116LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Credit for taxes on general category income
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:7px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:69mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignGeneralIncTaxCreditAmt"/>
                  <xsl:with-param name="Number">24</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (25) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">25</div>
              <div class="styIRS1116LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                    Credit for taxes on certain income re-sourced by treaty
                  </div>
                  <div class="styIRS1116LNDesc" style="width:auto;height:100%;padding-right:3px;float:right;">
                    <!--Dotted Line-->
                    <span class="styBoldText">.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:69mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncRsrcdTreatyTaxCrAmt"/>
                  <xsl:with-param name="Number">25</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (26) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">26</div>
              <div class="styIRS1116LNDesc" style="width:110mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                    Credit for taxes on lump-sum distributions
                  </div>
                  <div class="styIRS1116LNDesc" style="width:auto;height:100%;padding-right:3px;float:right;">
                    <!--Dotted Line-->
                    <span class="styBoldText">.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:69mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncLumpSumDistribCrAmt"/>
                  <xsl:with-param name="Number">26</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (27) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">27</div>
              <div class="styIRS1116LNDesc" style="width:145mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                    Add lines 23 through 26
                  </div>
                  <div class="styIRS1116LNDesc" style="width:auto;height:100%;float:right;padding-right:16px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:34mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/TentativeForeignTaxCreditAmt"/>
                  <xsl:with-param name="Number">27</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (28) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">28</div>
              <div class="styIRS1116LNDesc" style="width:145mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                    Enter the <b>smaller</b> of line 20 or line 27
                  </div>
                  <div class="styIRS1116LNDesc" style="width:auto;height:100%;float:right;padding-right:16px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:34mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/SmllrOfRtnTaxOrForeignTaxCrAmt"/>
                  <xsl:with-param name="Number">28</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (29) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">29</div>
              <div class="styIRS1116LNDesc" style="width:145mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                  <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                    Reduction of credit for international boycott operations. See instructions for line 12
                  </div>
                  <div class="styIRS1116LNDesc" style="width:auto;height:100%;float:right;padding-right:16px;">
                    <!--Dotted Line-->
                    <span class="styBoldText">.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                    </span>
                  </div>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:34mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/IntlBoycottCreditReductionAmt"/>
                  <xsl:with-param name="Number">29</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- (30) ////////////////////////////////////////////////////-->
            <div class="styIRS1116LineItem">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left;padding-left:5px;">30</div>
              <div class="styIRS1116LNDesc" style="width:145mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS1116LNDesc" style="width:auto;height:100%;">
                  Subtract line 29 from line 28. This is your <b>foreign tax credit.</b> Enter here and on Form 1040, line 47;<br/>
                  Form 1040NR, line 45; Form 1041, Schedule G, line 2a; or Form 990-T, line 40a
                  <!--Dotted Line-->
                  <span class="styBoldText">
                    <span style="width:2px"/>
                    <span style="width:15px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                    <span style="width:5px"/>
                    <img src="{$ImagePath}/1116_Bullet_Sm.gif" alt="SmallBullet"/>
                  </span>
                </div>
              </div>
              <div class="styIRS1116LNDesc" style="height:100%;width:34mm;float:right;padding:0px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="Height">3.5mm</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxCreditAmt"/>
                  <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;</xsl:with-param>
                  <xsl:with-param name="Number">30</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:right;">
              <span style="width:50px;"/>  
                Form 
              <span class="styBoldText" style="font-size:8pt;">1116</span> (2012)
            </div>
          </div>
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form1116Data"/>
              <xsl:with-param name="DescWidth" select="130"/>
            </xsl:call-template>
            <xsl:if test="$Form1116Data/AlternativeMinimumTaxCd">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Alternative Minimum Tax Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/AlternativeMinimumTaxCd"/>
                <xsl:with-param name="DescWidth" select="130"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form1116Data/ForeignRegulatedInvestmtCompCd">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part I, Line g - Foreign Regulated Investment Comp Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignRegulatedInvestmtCompCd"/>
                <xsl:with-param name="DescWidth" select="130"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form1116Data/ForeignIncHighTaxedKickOutCd">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part I, Line g - Foreign Income High Taxed Kickout Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncHighTaxedKickOutCd"/>
                <xsl:with-param name="DescWidth" select="130"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form1116Data/ForeignTaxAvailForCrReductAmt/@foreignIncHighTaxKickOutAdjAmt">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part III, Line 13 - Foreign Income High Tax Kick Out Adjustment Amount</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxAvailForCrReductAmt/@foreignIncHighTaxKickOutAdjAmt"/>
                <xsl:with-param name="DescWidth" select="130"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form1116Data/ForeignTaxAvailForCrReductAmt/@foreignIncHighTaxKickOutAdjCd">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part III, Line 13 - Foreign Income High Tax Kick Out Adjustment Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxAvailForCrReductAmt/@foreignIncHighTaxKickOutAdjCd"/>
                <xsl:with-param name="DescWidth" select="130"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form1116Data/GrossForeignTaxCreditAmt/@foreignIncomeLumpSumDistribCd">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part III, Line 22 - Foreign Income Lump Sum Distribution Code</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/GrossForeignTaxCreditAmt/@foreignIncomeLumpSumDistribCd"/>
                <xsl:with-param name="DescWidth" select="130"/>
              </xsl:call-template>
            </xsl:if>
          </table>
          <!-- Separated Data for Part I -->
          <xsl:if test="($Print = $Separated) and  (count($Form1116Data/ForeignTaxCreditSource) &gt; 3)">
            <br/><br/>
            <span class="styRepeatingDataTitle">
              Form 1116, Part II - Foreign Taxes Paid or Accrued
            </span>
            <table class="styDepTbl" cellspacing="0">
              <thead class="styTableThead">
                <xsl:call-template name="CreatePartIITableHeaders">
                  <xsl:with-param name="AddColoredHeaders">true</xsl:with-param>
                </xsl:call-template>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form1116Data/ForeignTaxCreditSource">
                  <xsl:variable name="Letter"><xsl:number format="A"/></xsl:variable>
                  <xsl:call-template name="CreatePartIITableRows">
                    <xsl:with-param name="AddColorCodeRow">true</xsl:with-param>
                    <xsl:with-param name="RowLetter"><xsl:value-of select="$Letter"/></xsl:with-param>
                  </xsl:call-template>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
