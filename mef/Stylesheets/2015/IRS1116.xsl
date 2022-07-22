<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 06/08/2017 -->
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
	<!-- /////////////////////////////////////////// (Template: CreateBox) -->
	<xsl:template name="CreateBox">
    <xsl:param name="TargetNode"/>
    <xsl:param name="PopulateAsText"/>
    <xsl:param name="AmountBoxStyle"/>
    <xsl:param name="NumberBoxStyle"/>
    <xsl:param name="Number"/>
    <xsl:param name="Width">26mm</xsl:param>
    <xsl:param name="Height">5mm</xsl:param>
    <div style="float:right;">
    <div class="styLNRightNumBox">
      <xsl:attribute name="style">
        float:left;
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
    <div class="styLNAmountBox">
    <xsl:if test="$Number!=12">
      <xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;
        height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
        <xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
        </xsl:if>
        <xsl:if test="$Number=12">
        <xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;
        height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
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
    </div>
  </xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- /////////////////////////////////////////// (Template:CreateBoxLeft) -->
	<xsl:template name="CreateBoxLine7">
    <xsl:param name="TargetNode"/>
    <xsl:param name="PopulateAsText"/>
    <xsl:param name="AmountBoxStyle"/>
    <xsl:param name="NumberBoxStyle"/>
    <xsl:param name="Number"/>
    <xsl:param name="Width">25mm</xsl:param>
    <xsl:param name="Height">5mm</xsl:param>
    <div class="styLNRightNumBox">
      <xsl:attribute name="style">
        width:8mm;
        float:left;
        padding:3px 0px 0px 0px;
        border-right-width:0px;
        height:<xsl:value-of select="$Height"/>;
        <xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$Number">
        <xsl:value-of select="$Number"/>
      </xsl:if>
    </div>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        width:25.25mm;
        height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
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
  </xsl:template>
   <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
  <!-- /////////////////////////////////////////// (Template:CreateBoxLeft) -->
  <xsl:template name="CreateBoxLine12">
    <xsl:param name="TargetNode"/>
    <xsl:param name="PopulateAsText"/>
    <xsl:param name="AmountBoxStyle"/>
    <xsl:param name="NumberBoxStyle"/>
    <xsl:param name="Number"/>
    <xsl:param name="Width">25mm</xsl:param>
    <xsl:param name="Height">5mm</xsl:param>
    <div class="styLNRightNumBox">
      <xsl:attribute name="style">
        width:8mm;
        float:left;
        padding:3px 0px 0px 0px;
        border-right-width:0px;
        height:<xsl:value-of select="$Height"/>;
        <xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:if test="$Number">
        <xsl:value-of select="$Number"/>
      </xsl:if>
    </div>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        width:25.25mm;
        height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
        <xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
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
  </xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- /////////////////////////////////////////// (Template: CreateBoxText) -->
	<xsl:template name="CreateBoxText">
    <xsl:param name="TargetNode"/>
    <xsl:param name="PopulateAsText"/>
    <xsl:param name="AmountBoxStyle"/>
    <xsl:param name="NumberBoxStyle"/>
    <xsl:param name="Number"/>
    <xsl:param name="Width">26mm</xsl:param>
    <xsl:param name="Height">5mm</xsl:param>
    <div style="float:right;">
    <div class="styLNRightNumBox">
      <xsl:attribute name="style">
        float:left;
        padding:3px 0px 0px 0px;
        border-right-width:0px;
        height:<xsl:value-of select="$Height"/>;
        <xsl:if test="$NumberBoxStyle">
        <xsl:value-of select="$NumberBoxStyle"/>
        </xsl:if>
        </xsl:attribute>
      <xsl:if test="$Number">
        <xsl:value-of select="$Number"/>
      </xsl:if>
    </div>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;
        height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
        <xsl:if test="$AmountBoxStyle">
        <xsl:value-of select="$AmountBoxStyle"/>
        </xsl:if>
        </xsl:attribute>
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
			<td class="styLNLeftNumBox" style="width: 5mm; height: 4mm;"/>
			<td class="styGenericDiv" style="width: 73mm; height: 4mm;"/>
			<td class="styLNAmountBox" style="width: 75mm; border-left-width: 1px; font-weight:bold; text-align: center;" colspan="3">
      Foreign Country or U.S. Possession
    </td>
			<td class="styLNAmountBoxNBB" style="width: 34mm; text-align: center; font-weight: bold;" colspan="2">
		Total					
	</td>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 4mm; padding-left: 2mm; font-weight: bold;">g</td>
			<td class="styGenericDiv" style="width:73mm;font-weight:bold;padding-bottom:0mm;">
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
			<td class="styLNLeftNumBox" style="width: 5mm; height: 4mm; font-weight: bold;"/>
			<td class="styGenericDiv" style="width: 73mm; height: 4mm; padding-top: 0mm; font-weight: bold;">
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
				<span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold;">.........</span>
				<span style="width:2mm;"/>
				<img src="{$ImagePath}/1116_Bullet_Sm.gif" alt="SmallBullet"/>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; text-align: center; font-size: 7pt; border-left-width: 1px;">
				<xsl:choose>
					<xsl:when test="$ColA/ForeignTaxCrSplittingEventCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$ColA/ForeignTaxCrSplittingEventCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$ColA/ForeignCountryCd"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; text-align: center; font-size: 7pt;">
				<xsl:choose>
					<xsl:when test="$ColB/ForeignTaxCrSplittingEventCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$ColB/ForeignTaxCrSplittingEventCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$ColB/ForeignCountryCd"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; text-align: center; font-size: 7pt;">
				<xsl:choose>
					<xsl:when test="$ColC/ForeignTaxCrSplittingEventCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$ColC/ForeignTaxCrSplittingEventCd"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$ColC/ForeignCountryCd"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 4mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 6.5mm; padding-left: 1mm; font-weight: bold;">1a</td>
			<td class="styGenericDiv" style="width: 73mm; height: 6.5mm;">
      Gross income from sources within country shown
      above and of the type checked above (see
      instructions): <span style="width: 73mm; height: 3.5mm; border-bottom-color: black; border-bottom-width: 1px; border-bottom-style: dashed;"> </span>
			</td>
			<td class="styLNAmountBoxSmallNBB" style="width: 25mm; height: 6.5mm; border-left-width: 1px; background-color: lightgrey;">
    </td>
			<td class="styLNAmountBoxSmallNBB" style="width: 25mm; height: 6.5mm; background-color: lightgrey;">
    </td>
			<td class="styLNAmountBoxSmallNBB" style="width: 25mm; height: 6.5mm; background-color: lightgrey;">
    </td>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 6.5mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 6.5mm;"/>
		</tr>
		<tr>
			<td class="styLNLeftNumBox" style="width: 5mm; height: 7mm; padding-left: 1mm;"/>
			<td class="styGenericDiv" style="border-width: 0px 0px 1px; border-style: solid solid dashed; border-color: black; width: 73mm; height: 6.3mm; font-size: 6.5pt;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form1116Data/IncomeFromForeignSourceTypeCd"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form1116Data/IncomeFromForeignSourceTxt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="padding: 3.5mm 0.5mm 0mm 0mm; width: 25mm; height: 7mm; border-left-width: 1px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColA/ForeignGrossIncomeAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="padding: 3.5mm 0.5mm 0mm 0mm; width: 25mm; height: 7mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColB/ForeignGrossIncomeAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="padding: 3.5mm 0.5mm 0mm 0mm; width: 25mm; height: 7mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColC/ForeignGrossIncomeAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNRightNumBox" style="padding: 3.5mm 0.5mm 0mm 0mm; width: 8mm; height: 7mm; padding-top: 3mm;">1a</td>
			<td class="styLNAmountBoxSmall" style="width: 26mm; height: 7mm; padding-top: 3.5mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form1116Data/TotalForeignGrossIncomeAmt"/>
				</xsl:call-template>
			</td>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 14mm; padding-left: 2.5mm; font-weight: bold; border-bottom-width: 1px; border-bottom-style: solid;">
		b
	</td>
			<td class="styGenericDiv" style="width: 73mm; height: 14mm; border-bottom-width: 1px; border-bottom-style: solid;">
      Check if line 1a is compensation for personal
      services as an employee, your total
      compensation from all sources is $250,000 or
      more, and you used an alternative basis to
      determine its source (see instructions)
         <xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form1116Data/AltBasisCompensationSourceInd"/>
				</xsl:call-template>
				<span style="padding-left: 1mm; letter-spacing: 2.5mm; font-weight: bold;">..</span>
				<span style="width:2mm;"/>
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
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 14mm; border-left-width: 1px; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 14mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 14mm; background-color: lightgrey;"/>
			<td class="styLNRightNumBox" style="width: 8mm; height: 14mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 14mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 78mm; height: 4mm; border-top-width: 1px;" colspan="2">
				<span class="styBoldText">
			Deductions and losses        
				<span class="styItalicText">          
					(Caution:        
				</span>
				</span>
				<span class="styItalicText">        
			See instructions):      
		</span>
			</td>
			<td class="styLNAmountBoxSmallNBB" style="width: 25mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 25mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 25mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 4mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 8.5mm; padding-left: 1mm; font-weight: bold;">
		2
	</td>
			<td class="styGenericDiv" style="width: 73mm; height: 7mm;">
		Expenses 
		<span class="styBoldText">
			definitely related
		</span> 
		to the income on line 1a (attach statement)
      <span style="padding-left:1mm;letter-spacing:3.3mm;font-weight:bold; ">...........</span>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 8.5mm; padding-right: 0px; padding-top:1mm; border-left-width: 1px;">
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$ColA/ForeignIncRelatedExpensesAmt"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColA/ForeignIncRelatedExpensesAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 8.5mm; padding-right: 0px; padding-top:1mm;">
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$ColB/ForeignIncRelatedExpensesAmt"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColB/ForeignIncRelatedExpensesAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 8.5mm; padding-right: 0px; padding-top:1mm;">
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$ColC/ForeignIncRelatedExpensesAmt"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColC/ForeignIncRelatedExpensesAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 8.5mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 8.5mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 4mm; padding-left: 1mm; font-weight: bold;">3</td>
			<td class="styGenericDiv" style="width: 73mm; height: 4mm; font-size: 6.5pt;">
      Pro rata share of other deductions
      <span class="styBoldText" style="font-size: font-size: 6.5pt;">
		  not definitely related:
	  </span>
			</td>
			<td class="styLNAmountBoxSmallNBB" style="width: 25mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 25mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 25mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 4mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 7mm; padding-left: 2.5mm; font-weight: bold;">a</td>
			<td class="styGenericDiv" style="width: 73mm; height: 7mm;">
      Certain itemized deductions or standard deduction (see instructions)
      <span style="padding-left:1mm;letter-spacing:3.3mm;font-weight:bold; ">............</span>
			</td>
			<td class="styLNAmountBoxSmall" style="padding-top: 3.5mm; width: 25mm; height: 7mm; padding-right: 0px; border-left-width: 1px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColA/ItemizedOrStandardDeductionAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="padding-top: 3.5mm; width: 25mm; height: 7mm; padding-right: 0px; padding-left: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColB/ItemizedOrStandardDeductionAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="padding-top: 3.5mm; width: 25mm; height: 7mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColC/ItemizedOrStandardDeductionAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 7mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 7mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" valign="top" style="width: 5mm; height: 4mm; padding-left: 2.5mm; font-weight: bold;">b</td>
			<td class="styGenericDiv" style="width: 73mm; height: 4mm;">
      Other deductions (attach statement)
      <span style="padding-left:1mm;letter-spacing:3.3mm;font-weight:bold; ">.....</span>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px; border-left-width: 1px;">
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$ColA/OtherDeductionsNotRelatedAmt"/>
				</xsl:call-template>
				<span style="float:left; font-size: 5.55pt;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$ColA/OtherDeductionsNotRelatedAmt"/>
					</xsl:call-template>
				</span>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$ColB/OtherDeductionsNotRelatedAmt"/>
				</xsl:call-template>
				<span style="float:left; font-size: 5.55pt;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$ColB/OtherDeductionsNotRelatedAmt"/>
					</xsl:call-template>
				</span>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$ColC/OtherDeductionsNotRelatedAmt"/>
				</xsl:call-template>
				<span style="float:left; font-size: 5.55pt;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$ColC/OtherDeductionsNotRelatedAmt"/>
					</xsl:call-template>
				</span>
			</td>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 4mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 4mm; padding-left: 2.5mm; font-weight: bold;">c</td>
			<td class="styGenericDiv" style="width: 73mm; height: 4mm;">
      Add lines 3a and 3b
      <span style="padding-left:1mm;letter-spacing:3.3mm;font-weight:bold; ">..........</span>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px; border-left-width: 1px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColA/TotalDeductionAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColB/TotalDeductionAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColC/TotalDeductionAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 4mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" valign="top" style="width: 5mm; height: 5mm; padding-top: 1mm; padding-left: 2.5mm; font-weight: bold;">d</td>
			<td class="styGenericDiv" style="padding-top: 1mm; width: 73mm; height: 5mm;">
      Gross foreign source income (see instructions)
      <span style="padding-left:1mm;letter-spacing:3.3mm;font-weight:bold; ">..</span>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 5mm; padding-top: 2mm; padding-right: 0px; padding-left: 0px; border-left-width: 1px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColA/GrossForeignSourceIncomeAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 5mm; padding-top: 2mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColB/GrossForeignSourceIncomeAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 5mm; padding-top: 2mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColC/GrossForeignSourceIncomeAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 5mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 5mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 4mm; padding-left: 2.5mm; font-weight: bold;">e</td>
			<td class="styGenericDiv" style="width: 73mm; height: 4mm;">
      Gross income from all sources (see instructions)
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">.</span>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px; border-left-width: 1px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColA/GrossIncomeAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColB/GrossIncomeAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColC/GrossIncomeAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 4mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 4mm; padding-left: 2.5mm; font-weight: bold;">f</td>
			<td class="styGenericDiv" style="width: 73mm; height: 4mm;">
      Divide line 3d by line 3e (see instructions)
      <span style="padding-left:1mm;letter-spacing:3.3mm;font-weight:bold; ">...</span>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px; border-left-width: 1px; color: darkblue;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$ColA/ForeignIncomePct"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px; color: darkblue;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$ColB/ForeignIncomePct"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px; color: darkblue;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$ColC/ForeignIncomePct"/>
				</xsl:call-template>
			</td>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 4mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 4mm; padding-left: 2.5mm; font-weight: bold;">g</td>
			<td class="styGenericDiv" style="width: 73mm; height: 4mm;">
      Multiply line 3c by line 3f
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">........</span>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px; border-left-width: 1px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColA/ProRataDeductionsNotRelatedAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColB/ProRataDeductionsNotRelatedAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColC/ProRataDeductionsNotRelatedAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 4mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="padding: 2mm 0mm 0mm 1mm; width: 5mm; height: 6mm; font-weight: bold;">4</td>
			<td class="styGenericDiv" style="padding: 2mm 0mm 0mm 1mm; width: 73mm; height: 6mm;">
      Pro rata share of interest expense (see instructions):
    </td>
			<td class="styLNAmountBoxSmallNBB" style="padding: 2mm 0mm 0mm 1mm; width: 25mm; height: 6mm; border-left-width: 1px; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="padding: 2mm 0mm 0mm 1mm; width: 25mm; height: 6mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="padding: 2mm 0mm 0mm 1mm; width: 25mm; height: 6mm; background-color: lightgrey;"/>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 6mm; background-color: lightgrey;"><span style="width:4px"/></td>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 6mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 6mm; padding-left: 2.5mm; font-weight: bold;">a</td>
			<td class="styGenericDiv" style="width: 73mm; height: 6mm;">
      Home mortgage interest (use the Worksheet for Home Mortgage Interest in the instructions)
      <span style="padding-left:1mm;letter-spacing:3.3mm;font-weight:bold; ">.....</span>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 6mm; padding-right: 0px; border-left-width: 1px; padding-top: 2.5mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColA/ApportionedHomeMortgIntExpAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 6mm; padding-right: 0px; padding-top: 2.5mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColB/ApportionedHomeMortgIntExpAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 6mm; padding-right: 0px; padding-top: 2.5mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColC/ApportionedHomeMortgIntExpAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 6mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 6mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 4mm; padding-left: 2.5mm; font-weight: bold;">b</td>
			<td class="styGenericDiv" style="width: 73mm; height: 4mm;">
      Other interest expense
      <span style="padding-left:2.5mm;letter-spacing:3.3mm;font-weight:bold; ">.........</span>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px; border-left-width: 1px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColA/ApportionedOtherInterestExpAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColB/ApportionedOtherInterestExpAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColC/ApportionedOtherInterestExpAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 4mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 4mm; padding-left: 1mm; font-weight: bold;">5</td>
			<td class="styGenericDiv" style="width: 73mm; height: 4mm;">
      Losses from foreign sources
      <span style="padding-left:1mm;letter-spacing:3.3mm;font-weight:bold; ">........</span>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px; border-left-width: 1px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColA/ForeignSourceLossAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColB/ForeignSourceLossAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColC/ForeignSourceLossAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNRightNumBoxNBB" style="width: 8mm; height: 4mm; background-color: lightgrey;"/>
			<td class="styLNAmountBoxSmallNBB" style="width: 26mm; height: 4mm;"/>
		</tr>
		<tr>
			<td class="styGenericDiv" style="width: 5mm; height: 4mm; padding-left: 1mm; font-weight: bold; border-bottom-width: 1px; border-bottom-style: solid;">6</td>
			<td class="styGenericDiv" style="width: 73mm; height: 4mm; border-bottom-width: 1px; border-bottom-style: solid;">
      Add lines 2, 3g, 4a, 4b, and 5
      <span style="padding-left:2mm;letter-spacing:3.3mm;font-weight:bold; ">.......</span>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px; border-left-width: 1px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColA/ForeignIncNetDeductAndLossAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColB/ForeignIncNetDeductAndLossAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNAmountBoxSmall" style="width: 25mm; height: 4mm; padding-right: 0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$ColC/ForeignIncNetDeductAndLossAmt"/>
				</xsl:call-template>
			</td>
			<td class="styLNRightNumBox" style="width: 8mm; height: 4mm;">6</td>
			<td class="styLNAmountBoxSmall" style="width: 26mm; height: 4mm;">
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
		<xsl:variable name="CommonStyle">border-color:black;font-size:6.5pt;text-align:center;font-family:arial;</xsl:variable>
		<tr>
			<xsl:if test="$AddColoredHeaders">
				<xsl:attribute name="class">styDepTblHdr</xsl:attribute>
			</xsl:if>
			<!-- Country -->
			<th class="styIRS1116TableCell" scope="col" rowspan="4">
				<xsl:attribute name="style">width:4%;border-top-width: 1px; border-top-style: solid;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				<img src="{$ImagePath}/1116_Country.gif" alt="CountryBullet"/>
			</th>
			<!-- Credit is claimed -->
			<th class="styIRS1116TableCell" scope="col" rowspan="3">
				<xsl:attribute name="style">width:12%;border-top-width: 1px; border-top-style: solid;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
				<b>Credit is claimed<br/>for taxes<br/>(you must check one)</b>
				<br/>
				<div style="text-align:left;width:100%;height:auto;padding-left:7px;">
					<b>(h)</b>
					<span style="width:5px;"/>
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
          </label>
					<br/>
					<b>(i)</b>
					<span style="width:8px;"/>
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
				<xsl:attribute name="style">width:84%;border-top-width: 1px; border-top-style: solid;<xsl:value-of select="$CommonStyle"/></xsl:attribute>
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
		<xsl:variable name="CommonStyle">font-size: 8pt; text-align:right;font-family:arial narrow;word-wrap:break-word;</xsl:variable>
		<tr style="font-size: 7pt;">
			<xsl:if test="$AddColorCodeRow">
				<xsl:attribute name="class"><xsl:value-of select="$ClassType"/></xsl:attribute>
			</xsl:if>
			<!-- Country  ++++++++++++++++++++ -->
			<td class="styIRS1116TableCell">
				<xsl:attribute name="style">
          width:4%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/></xsl:attribute>
				<b>
					<xsl:value-of select="$RowLetter"/>
				</b>
			</td>
			<!-- (J)  ++++++++++++++++++++ -->
			<td class="styIRS1116TableCell">
				<xsl:attribute name="style">
          width:12%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/></xsl:attribute>
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
					<xsl:with-param name="TargetNode" select="TotalForeignTaxesPaidOrAccrAmt"/>
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
          width:4%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/></xsl:attribute>
				<b>
					<xsl:value-of select="$RowLetter"/>
				</b>
			</td>
			<!-- (J)  ++++++++++++++++++++ -->
			<td class="styIRS1116TableCell">
				<xsl:attribute name="style">
          width:12%;<xsl:value-of select="$CommonStyle"/><xsl:value-of select="$IsLast"/></xsl:attribute>
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
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
					<div style="clear: left; float: left;">
						<xsl:call-template name="DocumentHeader"/>
					</div>
					<div class="styBB" style="width: 187mm; height: 22.1mm; border-bottom-width: 2px;">
						<div class="styFNBox" style="width: 30mm; height: 22.1mm; padding-top: 0.5mm; border-right-width: 2px;">
							<div style="width: 7mm; height: 9mm; padding-top: 5mm;">
                  Form
              </div>
							<div class="styFormNumber" style="width: 21mm; height: 9mm; padding-top: 1mm;">       
                  1116
               </div>
							<!--General Dependency Push Pin-->
							<div>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form1116Data"/>
								</xsl:call-template>
							</div>
							<div>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Alternative Minimum Tax Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$Form1116Data/AlternativeMinimumTaxCd"/>
								</xsl:call-template>
							</div>
							<div class="styAgency" style="width: 30mm; height: 4mm; padding-top: 1mm;"> 
				  Department of the Treasury
			  </div>
							<div class="styAgency" style="width: 30mm; height: 3mm;">
				  Internal Revenue Service (99)
			  </div>
						</div>
						<div class="styFTBox" style="width: 127mm; height: 22.1mm; padding-top: 0.5mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="width: 127mm; height: 6mm;">
                Foreign Tax Credit
              </div>
							<div class="styBoldText" style="width: 127mm; height: 5mm; font-size: 8pt;">
				  (Individual, Estate, or Trust)
			  </div>
							<div class="styFST" style="width: 127mm; height: 3.5mm;">
								<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallBullet"/> 
                      Attach to Form 1040, 1040NR, 1041, or 990-T.
               </div>
							<div class="styFST" style="width: 127mm; height: 3mm;">
								<img src="{$ImagePath}/1040ScheduleH_Bullet_Sm.gif" alt="SmallBullet"/> 
                      Information about Form 1116 and its separate instructions is at
               </div>
							<div style="width: 127mm; height: 3.5mm; font-style: oblique; font-weight: bold;">
					www.irs.gov/form1116.
				</div>
						</div>
						<div class="styTYBox" style="width: 30mm; height: 22.1mm; padding-top: 0.5mm; border-left-width: 2px;">
							<div class="styOMB" style="width: 30mm; height: 4mm; font-size: 7pt;">
              	   OMB No. 1545-0121  
              	</div>
							<div class="styTY" style="width: 7.5mm; height: 9mm;">
              	   20   
                </div>
							<div class="styTY styTYColor" style="width: 7.5mm; height: 9mm;">
                   15   
                </div>
							<div style="width: 30mm; height: 3mm; text-align: left; padding-top: 0.5mm; padding-left: 5mm; font-size: 7pt;">
				   Attachment   
                </div>
							<div style="width: 30mm; height: 5mm; text-align: left; padding-left: 5mm; font-size: 7pt;">
                   Sequence No.<span class="styBoldText" style="width: 5mm; font-size: 9pt;">19</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width: 187mm; height: 10mm;">
						<div class="styNameBox" style="width: 108mm; height: 10mm;">
							<div class="styNameBox" style="width: 108mm; height: 3mm; font-size: 7pt; font-weight: normal;">Name 
							</div>
							<div class="styNameBox" style="border-right-width:0px;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>	
										</xsl:call-template>			
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>			
									 </xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
										</xsl:call-template>	
									</xsl:otherwise>
								</xsl:choose>    
							</div>
						</div>
						<div class="styEINBox" style="width: 79mm; height: 10mm; font-size: 7pt; font-weight: normal;">
							<div class="styEINBox" style="width: 29mm; height: 3mm; padding-left: 1mm; font-size: 7pt;">
                   Identifying number
               </div>
							<div class="styNormalText" style="width: 49mm; height: 3mm;">       
                 as shown on page 1 of your tax return        
               </div>
							<div style="width: 79mm; height: 6.5mm; padding-left: 1mm;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
							</div>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- Begin Top Section -->
					<div class="styIRS1116LineItem" style="border-style: solid; border-color: rgb(0, 0, 0); width: 187mm; height: 8mm; padding-top: 2px; clear: left; border-bottom-width: 1px; float: left;">
				  Use a separate Form 1116 for each category of income listed below. See <b>Categories of Income</b> in the instructions.  
				  Check only one box on each Form 1116. Report all amounts in U.S. dollars except where specified in Part II below.				
			</div>
					<!-- 1st line of checkboxes -->
					<div class="styIRS1116LineItem" style="width: 187mm; height: 5mm; clear: left; float: left;">
						<!-- (a) Passive category income checkbox -->
						<div class="styIRS1116LNDesc" style="padding: 0px; width: 60mm; height: 5mm;">
							<xsl:call-template name="CreateTopSectionCheckbox">
								<xsl:with-param name="SpaceBefore">2px</xsl:with-param>
								<xsl:with-param name="Number">a</xsl:with-param>
								<xsl:with-param name="Desc">Passive category income</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncPassiveCategoryInd"/>
								<xsl:with-param name="BackupName">Form1116DataForeignIncPassiveCategoryInd</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (c) Section 901(j) income checkbox -->
						<div class="styIRS1116LNDesc" style="padding: 0px; width: 60mm; height: 5mm;">
							<xsl:call-template name="CreateTopSectionCheckbox">
								<xsl:with-param name="Number">c</xsl:with-param>
								<xsl:with-param name="Desc">Section 901(j) income</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncSection901jInd"/>
								<xsl:with-param name="BackupName">Form1116DataForeignIncSection901jInd</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (e) Lump-sum distributions checkbox -->
						<div class="styIRS1116LNDesc" style="padding: 0px; width: 67mm; height: 5mm;">
							<xsl:call-template name="CreateTopSectionCheckbox">
								<xsl:with-param name="Number">e</xsl:with-param>
								<xsl:with-param name="Desc">Lump-sum distributions</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncLumpSumDistribInd"/>
								<xsl:with-param name="BackupName">Form1116DataForeignIncLumpSumDistribInd</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- 2nd line of checkboxes -->
					<div class="styIRS1116LineItem" style="border-style: solid; border-color: rgb(0, 0, 0); width: 187mm; height: 6mm; clear: left; border-bottom-width: 1px; float: left;">
						<!-- (b) General category income checkbox -->
						<div class="styIRS1116LNDesc" style="padding: 0px; width: 60mm; height: 5mm;">
							<xsl:call-template name="CreateTopSectionCheckbox">
								<xsl:with-param name="SpaceBefore">2px</xsl:with-param>
								<xsl:with-param name="Number">b</xsl:with-param>
								<xsl:with-param name="Desc">General category income</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncGeneralCategoryInd"/>
								<xsl:with-param name="BackupName">Form1116DataForeignIncGeneralCategoryInd</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- (d) Certain income re-sourced by treaty checkbox -->
						<div class="styIRS1116LNDesc" style="padding: 0px; width: 127mm; height: 5mm;">
							<xsl:call-template name="CreateTopSectionCheckbox">
								<xsl:with-param name="Number">d</xsl:with-param>
								<xsl:with-param name="Desc">Certain income re-sourced by treaty</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncResourcedTreatyInd"/>
								<xsl:with-param name="BackupName">Form1116DataForeignIncResourcedTreatyInd</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<br/>
					<div class="styBB" style="width: 187mm; height: 5mm; padding-top: 0.5mm;">
						<div class="styIRS1116LineItem" style="width: 187mm; height: 5mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 3mm; text-align: left; padding-right: 0mm; padding-left: 0mm;">
          	  f
          	  </div>
							<div class="styIRS1116LNDesc" style="width: 42mm; height: 5mm; padding-left: 0mm;">
          	    Resident of (name of country)                
          	    <img src="{$ImagePath}/1116_Bullet_Sm.gif" alt="SmallBullet"/>
							</div>
							<div class="styIRS1116LNDesc" style="width: 140mm; height: 5mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form1116Data/ResidenceForeignCountryCd"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styBB" style="width: 187mm; height: 7.5mm; padding-top: 0.5mm; border-bottom-width: 0px;">
						<div class="styBB" style="width: 9mm; height: 7mm; font-weight: bold;">
                  Note:   
             </div>
						<div class="styBB" style="width: 178mm; height: 7mm; clear: none; font-style: oblique;">
                  If you paid taxes If you paid taxes to only one foreign country or U.S. possession, use column A in Part I and line A in Part II. If you paid taxes to <b>more than one</b> 
                  foreign country or U.S. possession, use a separate column and line for each country or possession.
             </div>
					</div>
					<!-- End Top Section -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!--  Begin PART I -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Header -->
					<!-- Content -->
					<div style="border-width: 0px 0px 1px; border-style: solid; border-color: black; width: 187mm; height: 4mm; clear: left; float: left;">
						<div class="styPartName" style="width: 15mm; height: 3.6mm;">Part I</div>
						<div class="styPartDesc" style="width: 172mm; height: 3.6mm; padding-left: 3mm;">
              Taxable Income or Loss From Sources Outside the United States (for Category Checked Above)
            </div>
					</div>
					<!-- Body -->
					<!-- Table starts here -->
					<!-- Retrevie all ForeignTaxCreditSource elements -->
					<table class="styTable" cellspacing="0" style="width:187mm; height:auto; font-size:7pt; clear: left; float: left;">
						<xsl:variable name="AllForeign" select="$Form1116Data/*[starts-with(name(), 'ForeignTaxCreditSource')]"/>
						<xsl:choose>
							<xsl:when test="count($Form1116Data/ForeignTaxCreditSource) &gt; 0">
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
            <div class="styIRS1116LineItem" style="width:187mm;height:4.5mm;">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left; height:4.5mm; width:5mm; padding-left:1mm;">7</div>
              <div class="styIRS1116LNDesc" style="width:147mm; padding-left:0mm; height:4.5mm; float:none;">
                Subtract line 6 from line 1a. Enter the result here and on line 15, page 2
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:1px"/>.
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
                  <img src="{$ImagePath}/1116_Bullet_Sm.gif" alt="SmallBullet" />                 
                </span>
              </div>
              <xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">7</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;border-left-width:0px;width:24.8mm;height:4.5mm;float:none;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;border-right-width:1px;width:8.25mm;height:4.5mm;float:none;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/NetForeignTaxableIncomeLossAmt"/>
                <xsl:with-param name="Width">18mm;</xsl:with-param>
              </xsl:call-template>
            </div>
          </div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!--  Begin PART II -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Header -->
					<div class="styBB" style="width: 187mm; height: 4mm; border-top-width: 1px;">
						<!-- Content -->
						<div class="styPartName" style="width: 15mm; height: 3.5mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;">
              Foreign Taxes Paid or Accrued <span class="styNormalText">(see instructions)</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width: 187mm; height: auto; border-bottom-width: 0px;">
						<!-- (Table) //////////////////////////////////////////////////////////////// -->
						<div class="styIRS1116LineItem" style="width: 187mm; height: auto;">
							<div class="styGenericDiv" style="width: 187mm; height: auto; text-align: right;">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxCreditSource"/>
									<xsl:with-param name="containerHeight" select="3"/>
									<xsl:with-param name="containerID" select=" 'ForeignTaxCreditSourceDiv' "/>
									<xsl:with-param name="headerRowCount" select="4"/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
							<div class="styTableContainer" id="ForeignTaxCreditSourceDiv" style="width: 187mm; height:auto; border-top-width: 1px; border-bottom-width: 1px;">
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
											<xsl:variable name="Letter">
												<xsl:number format="A"/>
											</xsl:variable>
											<xsl:if test="($Print != $Separated) or (count($Form1116Data/ForeignTaxCreditSource) &lt;=3)">
												<xsl:call-template name="CreatePartIITableRows">
													<xsl:with-param name="RowLetter">
														<xsl:value-of select="$Letter"/>
													</xsl:with-param>
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
					<div class="styIRS1116LineItem" style="height:4.5mm; width: 187mm; border-bottom-width: 2px; border-bottom-color: #000000;">
              <div class="styIRS1116LNLeftNumBox" style="text-align:left; height:4.5mm; width:5mm; padding-left:1mm;">8</div>
              <div class="styIRS1116LNDesc" style="width:147mm; padding-left:0mm; height:4.5mm; float:none;">
                	<b>Add lines A through C, column (s). Enter the total here and on line 9, page 2</b>
                	<span class="styBoldText">
                		<span style="width: 2px;"></span>.
                	    <span style="width: 10px;"></span>.                  
                	    <span style="width: 11px;"></span>.                  
                	    <span style="width: 11px;"></span>.                  
                	    <span style="width: 11px;"></span>.                 
                	    <span style="width: 11px;"></span>.                  
                	    <span style="width: 11px;"></span>.                  
                	    <span style="width: 11px;"></span>.
                	     <span style="width: 11px;"></span>
                        <img src="{$ImagePath}/1116_Bullet_Sm.gif" alt="SmallBullet"/>
                    </span>
                </div>
                <xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">8</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;border-left-width:0px;width:24.8mm;height:4.5mm;float:none;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;border-right-width:1px;width:8mm;height:4.5mm;float:none;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/TotalForeignTaxesPaidOrAccrAmt"/>
                <xsl:with-param name="Width">18mm;</xsl:with-param>
              </xsl:call-template>
            </div>
            </div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div style="width: 187mm; height: auto; clear: left; float: left; padding-bottom: 15mm;">
						<div style="width: 98mm; height:auto;">
							<span class="styBoldText"> For Paperwork Reduction Act Notice, see instructions.</span>
						</div>
						<div style="width: 40mm; height: auto; font-size: 7pt;">
			    Cat. No. 11440U
			</div>
						<div style="width: 47mm; height: auto; text-align: right;">
							<span style="width: 50px;"/>
				  Form               
				<span class="styBoldText" style="font-size: 8pt;">1116</span> (2015)            
			</div>
			<p style="width: 187mm; height: auto; page-break-before: always;"></p>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm; height: auto;">
						<div style="float:left;">
              Form 1116 (2015)
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
					<div class="styBB" style="width: 187mm; height: 4mm;">
						<div class="styPartName" style="width: 15mm; height: 4mm;">Part III</div>
						<div class="styPartDesc" style="width: 172mm; height: 4mm; padding-left: 3mm;">
              Figuring the Credit
            </div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width: 187mm; height: auto;">
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 8mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 5mm; height: 8mm; text-align: left; padding-top: 1.5mm; padding-left: 1mm;">
					9
				</div>
							<div class="styIRS1116LNDesc" style="width: 114mm; height: 8mm; padding-top: 1.5mm;">
					Enter the amount from line 8. These are your total foreign taxes paid or accrued<br/>
					 for the category of income checked above Part I
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
               <xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">9</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 4.5mm 0.5mm 0mm 0mm; width: 26mm; height: 8mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 4.5mm 0mm 0mm; height: 8mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/TotalForeignTaxesPaidOrAccrAmt"/> 
                <xsl:with-param name="Width">28mm;</xsl:with-param>
              </xsl:call-template>
              <div class="styLNRightNumBox" style="border-width: 0px 1px; padding: 0px; width: 8.25mm; height: 8mm; float: left; background-color: lightgrey;"></div>
			</div>
						<!-- (10) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 8mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 5mm; height: 8mm; text-align: left; padding-top: 4mm; padding-left: 1mm;">10</div>
							<div class="styIRS1116LNDesc" style="width: 114mm; height: 8mm; padding-top: 4mm;">
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
                    <span style="width:11px"/>.
                  </span>
              </div>
              <xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">10</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 4.5mm 0.5mm 0mm 0mm; width: 26mm; height: 8mm; text-align: right; font-size: 6pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 4.5mm 0mm 0mm; height: 8mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxCrCarrybackOrOverAmt"/>
				</xsl:call-template>
               <div class="styLNRightNumBox" style="border-width: 0px 1px; padding: 0px; width: 8.25mm; height: 8mm; float: left; background-color: lightgrey;"></div>
			</div>
						<!-- (11) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 8mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 5mm; height: 8mm; text-align: left; padding-top: 4mm; padding-left: 1mm;">11</div>
							<div class="styIRS1116LNDesc" style="width: 114mm; height: 8mm; padding-top: 4mm;">
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
                <xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">11</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 4.5mm 0.5mm 0mm 0mm; width: 26mm; height: 8mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 4.5mm 0mm 0mm; height: 8mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignGrossTaxPaidOrAccrAmt"/>
               </xsl:call-template>
               <div class="styLNRightNumBox" style="border-width: 0px 1px; padding: 0px; width: 8.25mm; height: 8mm; float: left; background-color: lightgrey;"></div>
              </div>
						<!-- (12) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 8mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 5mm; height: 8mm; text-align: left; padding-top: 4mm; padding-left: 1mm;">12</div>
							<div class="styIRS1116LNDesc" style="width: 114mm; height: 8mm; padding-top: 4mm;">
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
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.
                  </span>
                </div>
                <xsl:call-template name="CreateBoxLine12">
                <xsl:with-param name="Number">12</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 4.5mm 0.5mm 0mm 0mm; width: 26mm; height: 8mm; text-align: right; font-size: 5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 4.5mm 0mm 0mm; height: 8mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxReductionAmt"/>
                </xsl:call-template>
                 <div class="styLNRightNumBox" style="border-width: 0px 1px; padding: 0px; width: 8.25mm; height: 8mm; float: left; background-color: lightgrey;"></div>
            </div>
						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 8mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 5mm; height: 8mm; text-align: left; padding-top: 4mm; padding-left: 1mm;">13</div>
							<div class="styIRS1116LNDesc" style="width: 114mm; height: 8mm; padding-top: 4mm;">
            		Taxes reclassified under high tax kickout (see instructions)                                     
            		<span class="styBoldText">								
            		    <span style="width: 8px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.   
            		    <span style="width: 11px;"></span>.               
            		</span>
            	</div>						
            	<xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">13</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 4.5mm 0.5mm 0mm 0mm; width: 26mm; height: 8mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 4.5mm 0mm 0mm; height: 8mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncHighTaxKickOutAdjAmt"/>
			    </xsl:call-template>
				<div class="styLNRightNumBox" style="border-width: 0px 1px; padding: 0px; width: 8.25mm; height: 8mm; float: left; background-color: lightgrey;"></div>
            </div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 8mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 5mm; height: 8mm; text-align: left; padding-top: 4.5mm; padding-left: 1mm;">14</div>
							<div class="styIRS1116LNDesc" style="width: 148mm; height: 8mm; padding-top: 4.5mm;">
                  Combine lines 11, 12, and 13. This is the total amount of foreign taxes available for credit
                  <xsl:if test="$Form1116Data/ForeignTaxAvailableForCrRedAmt/@foreignIncHighTaxKickOutAdjAmt">
									<span style="width:5px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Foreign Income High Tax Kick Out Adjustment Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxAvailableForCrRedAmt/@foreignIncHighTaxKickOutAdjAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form1116Data/ForeignTaxAvailableForCrRedAmt/@foreignIncHighTaxKickOutAdjCd">
									<span style="width:5px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Foreign Income High Tax Kick Out Adjustment Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxAvailableForCrRedAmt/@foreignIncHighTaxKickOutAdjCd"/>
									</xsl:call-template>
								</xsl:if>
								<!--Dotted Line-->
								<span class="styBoldText">
									<span style="width:6px"/>.
                    <span style="width:11px"/>.
                    <span style="width:11px"/>.  
                    <span style="width:11px"/>.                   
                    <xsl:if test="not($Form1116Data/ForeignTaxAvailableForCrRedAmt/@foreignIncHighTaxKickOutAdjCd)">
										<span style="width:11px"/>.
                    </xsl:if>
									<xsl:if test="not($Form1116Data/ForeignTaxAvailableForCrRedAmt/@foreignIncHighTaxKickOutAdjAmt)">
										<span style="width:11px"/>.
                    </xsl:if>
								</span>
							</div>
							 <xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">14</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 4.5mm 0.5mm 0mm 0mm; width: 26mm; height: 8mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 4.5mm 0mm 0mm; height: 8mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxAvailableForCrRedAmt"/>
                </xsl:call-template>
           </div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 10.5mm;">
							<div class="styIRS1116LNLeftNumBox" style="padding: 1mm; width: 5mm; height: 12mm; text-align: left;">15</div>
							<div class="styIRS1116LNDesc" style="padding: 1mm 3mm; width: 114mm; height: 12mm;">
								<span style="vertical-align: middle; display: inline-block;">
						Enter the amount from line 7. This is your taxable income or (loss) from sources outside the United States (before adjustments) for 
						the category of income checked above Part I (see instructions)
						<span class="styBoldText">	
							<span style="width: 7px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.		    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.	            
						</span>         
					</span>
			    </div>
			     <xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">15</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 7.5mm 0.5mm 0mm 0mm; width: 26mm; height: 10.5mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 7mm 0mm 0mm; height: 10.5mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxableIncomeOrLossAmt"/>
                </xsl:call-template>
               <div class="styLNRightNumBox" style="border-width: 0px 1px; padding: 0px; width: 8.25mm; height: 10.5mm; float: left; background-color: lightgrey;"></div>
			</div>
						<!-- (16) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 5mm;">
							<div class="styIRS1116LNLeftNumBox" style="padding: 1.5mm 0.5mm 0.5mm 1mm; width: 5mm; height: 5mm; text-align: left;">16</div>
							<div class="styIRS1116LNDesc" style="padding: 1.25mm 3mm 0.5mm; width: 114mm; height: 5mm;">
								<span style="vertical-align: middle; display: inline-block;">
							Adjustments to line 15 (see instructions)
							<span class="styBoldText">
								  <span style="width: 7px;"></span>.
								  <span style="width: 11px;"></span>.
								  <span style="width: 11px;"></span>.
								  <span style="width: 11px;"></span>.
								  <span style="width: 11px;"></span>.
								  <span style="width: 11px;"></span>.
								  <span style="width: 11px;"></span>.
								  <span style="width: 11px;"></span>.
								  <span style="width: 11px;"></span>.
								  <span style="width: 11px;"></span>.
								  <span style="width: 11px;"></span>.
								  <span style="width: 11px;"></span>.
							</span>
						</span>
					</div>
					<xsl:call-template name="CreateBoxLine7">
                    <xsl:with-param name="Number">16</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">padding: 1.5mm 0.5mm 0mm 0mm; width: 26mm; height: 5mm; text-align: right; font-size: 6pt; border-right-width: 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">padding: 1.5mm 0mm 0mm; height: 5mm; border-right-width: 0px;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncomeNetAdjustmentAmt"/>
				    </xsl:call-template>
				    <div class="styLNRightNumBox" style="border-width: 0px 1px; padding: 0px; width: 8.25mm; height: 8mm; float: left; background-color: lightgrey;"></div>
				   </div>
						<!-- (17) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 13mm;">
							<div class="styIRS1116LNLeftNumBox" style="padding: 1mm 0.5mm 0.5mm 1mm; width: 5mm; height: 13mm; text-align: left;">17</div>
							<div class="styIRS1116LNDesc" style="padding: 1mm 3mm; width: 114mm; height: 13mm;">
								<span style="vertical-align: middle; display: inline-block;">
						   Combine the amounts on lines 15 and 16. This is your net foreign source taxable income. 
						   (If the result is zero or less, you have no foreign tax credit for the category of income you 
						   checked above Part I. Skip lines 18 through 22. However, if you are filing more than one 
						   Form 1116, you must complete line 20.)
							<span class="styBoldText">								
								<span style="width: 7px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                     
								<span style="width: 11px;"></span>.                   
							</span>
					</span>
				</div>																																				
				<xsl:call-template name="CreateBoxLine7">
                    <xsl:with-param name="Number">17</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">padding: 10mm 0.5mm 0mm 0mm; width: 26mm; height: 13mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">padding: 9.5mm 0mm 0mm; height: 13mm; border-right-width: 0px;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignNetTaxableIncomeAmt"/>
					</xsl:call-template>
				<div class="styLNRightNumBox" style="border-width: 0px 1px; padding: 0px; width: 8.25mm; height: 13mm; float: left; background-color: lightgrey;"></div>
			</div>
						<!-- (18) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 10mm;">
							<div class="styIRS1116LNLeftNumBox" style="padding: 1mm 0.5mm 0.5mm 1mm; width: 5mm; height: 10mm; text-align: left;">18</div>
							<div class="styIRS1116LNDesc" style="padding: 1mm 3mm; width: 114mm; height: 20mm;">
								<span style="vertical-align: middle; display: inline-block;">
									<b>Individuals:</b> Enter the amount from Form 1040, line 41, or Form 1040NR, line 39. 
							<b>Estates and trusts:</b> Enter your taxable income without the deduction for your exemption
	                    <span class="styBoldText">								
							<span style="width: 4px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                     
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                     
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
						</span>
					</span>
				</div>
				<xsl:call-template name="CreateBoxLine7">
                    <xsl:with-param name="Number">18</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">padding: 7mm 0.5mm 0mm 0mm; width: 26mm; height: 10mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">padding: 6.5mm 0mm 0mm; height: 10mm; border-right-width: 0px;</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxableIncBfExemptAmt"/>
                </xsl:call-template>
            <div class="styLNRightNumBox" style="border-width: 0px 1px; padding: 0px; width: 8.25mm; height: 10mm; float: left; background-color: lightgrey;"></div>	
        </div>
        <div class="styIRS1116LineItem" style="width: 187mm; height: 10mm;">
			<div class="styIRS1116LNLeftNumBox" style="width: 5mm; height: 10mm; text-align: left;"></div>
            <div class="styIRS1116LNDesc" style="padding: 1mm 3mm; width: 148mm; height: 10mm;">
				<span style="font-style: oblique; vertical-align: middle; display: inline-block;">
				<b>Caution:</b> If you figured your tax using the lower rates on qualified dividends or capital gains, see page 17 of the instructions.
				</span>
			</div>
			<div class="styLNRightNumBox" style="padding: 0px; width: 8mm; height: 10mm; border-bottom-width: 0px; border-left-width: 1px;"></div>
			<div class="styLNAmountBox" style="border-width: 0px 0px 0px 1px; padding: 0px; width: 26mm; height: 10mm; text-align: right; font-size: 6pt;"></div>
		</div>
						<!-- (19) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 5mm;">
							<div class="styIRS1116LNLeftNumBox" style="padding: 1mm 0.5mm 0.5mm 1mm; width: 5mm; height: 5mm; text-align: left;">19</div>
							<div class="styIRS1116LNDesc" style="padding: 1mm 3mm; width: 148mm; height: 5mm;">
								<span style="vertical-align: middle; display: inline-block;">
				    Divide line 17 by line 18. If line 17 is more than line 18, enter "1"                                    
				    <span class="styBoldText">								
				    <span style="width: 5px;"></span>.                    
				    <span style="width: 11px;"></span>.                    
				    <span style="width: 11px;"></span>.                    
				    <span style="width: 11px;"></span>.                    
				    <span style="width: 11px;"></span>.                    
				    <span style="width: 11px;"></span>.                    
				    <span style="width: 11px;"></span>.
				    <span style="width: 11px;"></span>.                    
				    <span style="width: 11px;"></span>.                    
				    <span style="width: 11px;"></span>.  
				    <span style="width: 11px;"></span>.                    
				    <span style="width: 11px;"></span>.
				    <span style="width: 11px;"></span>.  
				    </span>
				</span>
			</div>
			<xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">19</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 1.5mm 0.5mm 0mm 0mm; width: 26mm; height: 5mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 1.5mm 0mm 0mm; height: 5mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxableIncBfExemptRt"/>
				</xsl:call-template>
        </div>
						<!-- (20) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 12mm;">
							<div class="styIRS1116LNLeftNumBox" style="padding: 1mm 0.5mm 0.5mm 1mm; width: 5mm; height: 12mm; text-align: left;">20</div>
							<div class="styIRS1116LNDesc" style="padding: 1mm 3mm; width: 148mm; height: 12mm;">
								<span style="vertical-align: middle; display: inline-block;">
									<b>Individuals:</b> Enter the amounts from Form 1040, lines 44 and 46. If you are a nonresident alien, 
					enter the amounts from Form 1040NR, lines 42 and 44. <b> Estates and trusts:</b> Enter the amount 
					from Form 1041, Schedule G, line 1a, or the total of Form 990-T, lines 36 and 37                                    
					<span class="styBoldText">
						<span style="width: 6px;"></span>.                   
						<span style="width: 11px;"></span>.                   
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>. 
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                        
					</span>
				</span>
			</div>											
			   <xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">20</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 8.5mm 0.5mm 0mm 0mm; width: 26mm; height: 12mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 8.5mm 0mm 0mm; height: 12mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/TaxFromTaxReturnAmt"/>
                </xsl:call-template>
        </div>
        <div class="styIRS1116LineItem" style="width: 187mm; height: 4mm;">
			<div class="styIRS1116LNLeftNumBox" style="width: 5mm; height: 4mm; text-align: left;"></div>
			<div class="styIRS1116LNDesc" style="padding: 0mm 3mm 1mm; width: 148mm; height: 4mm;">
				<span style="font-style: oblique; vertical-align: middle; display: inline-block;">
					<b>Caution:</b> If you are completing line 20 for separate category e (lump-sum distributions), see instructions.
				</span>
			</div>
			<div class="styLNRightNumBox" style="padding: 0px; width: 8mm; height: 4mm; border-bottom-width: 0px; border-left-width: 1px;"></div>
			<div class="styLNAmountBox" style="border-width: 0px 0px 0px 1px; padding: 0px; width: 26mm; height: 4mm; text-align: right; font-size: 6pt;"></div> 
		</div>
						<!-- (21) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 4mm;">
							<div class="styIRS1116LNLeftNumBox" style="padding: 1mm 0.5mm 0.5mm 1mm; width: 5mm; height: 4mm; text-align: left;">21</div>
							<div class="styIRS1116LNDesc" style="padding: 0.5mm 3mm; width: 148mm; height: 4mm;">
								<span style="vertical-align: middle; display: inline-block;">
            		        Multiply line 20 by line 19 (maximum amount of credit)                                    
							<span class="styBoldText">
								<span style="width: 17px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>.                    
								<span style="width: 11px;"></span>. 
								<span style="width: 11px;"></span>.                  
							</span>
						</span>
					</div>
				<xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">21</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 0.5mm 0.5mm 0mm 0mm; width: 26mm; height: 4mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 0.5mm 0mm 0mm; height: 4mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/MaxAllowedForeignTaxCreditAmt"/>
					</xsl:call-template>
            </div>
						<!-- (22) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 8mm;">
							<div class="styIRS1116LNLeftNumBox" style="padding: 1mm 0.5mm 0.5mm 1mm; width: 5mm; height: 8mm; text-align: left;">22</div>
							<div class="styIRS1116LNDesc" style="padding: 0.5mm 3mm; width: 148mm; height: 8mm;">
								<span style="vertical-align: middle; display: inline-block;">                  
						Enter the <b>smaller</b> of line 14 or line 21. If this is the only Form 1116 you are filing, skip lines 23 through 27 
						and enter this amount on line 28. Otherwise, complete the appropriate line in Part IV (see instructions)
						<xsl:if test="$Form1116Data/GrossForeignTaxCreditAmt/@foreignIncomeLumpSumDistribCd">
										<span style="width:4px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Foreign Income Lump Sum Distribution Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1116Data/GrossForeignTaxCreditAmt/@foreignIncomeLumpSumDistribCd"/>
										</xsl:call-template>
									</xsl:if>
									<!--Dotted Line-->
									<span class="styBoldText">
						  <span style="width: 9px;"></span>. 
						  <span style="width: 9px;"></span>. 
						  <span style="width: 5px;"></span>
							<xsl:if test="not($Form1116Data/GrossForeignTaxCreditAmt/@foreignIncomeLumpSumDistribCd)">
								<span style="width:11px"/>.
							</xsl:if>
							<span style="width:5px"/>
							<img src="{$ImagePath}/1116_Bullet_Sm.gif" alt="SmallBullet"/>
						</span>
					</span>	
                </div>
				<xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">22</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 4.5mm 0.5mm 0mm 0mm; width: 26mm; height: 8mm; text-align: right; font-size: 6.5pt; border-right-width: 0px; border-bottom-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 4.5mm 0mm 0mm; height: 8mm; border-right-width: 0px; border-bottom-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/GrossForeignTaxCreditAmt"/>
				    </xsl:call-template>
            </div>
        </div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!--  Begin PART IV -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Header -->
					<div class="styBB" style="width: 187mm; height: 4mm; border-top-width: 0px;">
						<!-- Content -->
						<div class="styPartName" style="width: 15mm; height: 4mm;">Part IV</div>
						<div class="styPartDesc" style="width: 172mm; height: 4mm; padding-left: 3mm;">
              Summary of Credits From Separate Parts III <span class="styNormalText">(see instructions)</span>
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width: 187mm; height: auto; border-bottom-width: 2px;">
						<!-- (23) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 4mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 8mm; height: 4mm; text-align: left; padding-left: 5px;">23</div>
							<div class="styIRS1116LNDesc" style="padding: 0.5mm 0mm; width: 111mm; height: 4mm;">
            		    Credit for taxes on passive category income
            		    <span class="styBoldText">								
							<span style="width: 5px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                  
						</span>
					</div>
				<xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">23</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 1mm 0.5mm 0mm 0mm; width: 26mm; height: 4mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 0.5mm 0mm 0mm; height: 4mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignPassiveIncTaxCreditAmt"/>
                   </xsl:call-template>
                 <div class="styLNRightNumBox" style="border-width: 0px 1px; padding: 0px; width: 8.25mm; height: 4mm; float: left; background-color: lightgrey;"></div>
            </div>
						<!-- (24) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 4mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 8mm; height: 4mm; text-align: left; padding-left: 5px;">24</div>
							<div class="styIRS1116LNDesc" style="padding: 0.5mm 0mm; width: 111mm; height: 4mm;">
					   Credit for taxes on general category income
					   <span class="styBoldText">								
						   <span style="width: 5px;"></span>.                    
						   <span style="width: 11px;"></span>.                    
						   <span style="width: 11px;"></span>.                    
						   <span style="width: 11px;"></span>.                    
						   <span style="width: 11px;"></span>.                    
						   <span style="width: 11px;"></span>.                    
						   <span style="width: 11px;"></span>.                    
						   <span style="width: 11px;"></span>.                    
						   <span style="width: 11px;"></span>.                    
						   <span style="width: 11px;"></span>.                    
						   <span style="width: 11px;"></span>.                  
						</span>
					</div>
					<xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">24</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 1mm 0.5mm 0mm 0mm; width: 26mm; height: 4mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 0.5mm 0mm 0mm; height: 4mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignGeneralIncTaxCreditAmt"/>
					    </xsl:call-template>
                  <div class="styLNRightNumBox" style="border-width: 0px 1px; padding: 0px; width: 8.25mm; height: 4mm; float: left; background-color: lightgrey;"></div>
               </div>
						<!-- (25) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 4mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 8mm; height: 4mm; text-align: left; padding-left: 5px;">25</div>
							<div class="styIRS1116LNDesc" style="padding: 0.5mm 0mm; width: 111mm; height: 4mm;">
						Credit for taxes on certain income re-sourced by treaty
						<span class="styBoldText">								
							<span style="width: 5px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                    
							<span style="width: 11px;"></span>.                  
						</span>
					</div>
				<xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">25</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 1mm 0.5mm 0mm 0mm; width: 26mm; height: 4mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 0.5mm 0mm 0mm; height: 4mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncRsrcdTreatyTaxCrAmt"/>
                </xsl:call-template>
              <div class="styLNRightNumBox" style="border-width: 0px 1px; padding: 0px; width: 8.25mm; height: 4mm; float: left; background-color: lightgrey;"></div>
            </div>
						<!-- (26) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 4mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 8mm; height: 4mm; text-align: left; padding-left: 5px;">26</div>
							<div class="styIRS1116LNDesc" style="padding: 0.5mm 0mm; width: 111mm; height: 4mm;">Credit for taxes on lump-sum distributions
            		<span class="styBoldText">								
						<span style="width: 5px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    	
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    	
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    	
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                  	
					</span>
				</div>
			<xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">26</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 1mm 0.5mm 0mm 0mm; width: 26mm; height: 4mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 0.5mm 0mm 0mm; height: 4mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignIncLumpSumDistribCrAmt"/>
                </xsl:call-template>
              <div class="styLNRightNumBox" style="border-width: 0px 1px; padding: 0px; width: 8.25mm; height: 4mm; float: left; background-color: lightgrey;"></div>
            </div>
						<!-- (27) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 4mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 8mm; height: 4mm; text-align: left; padding-left: 5px;">27</div>
							<div class="styIRS1116LNDesc" style="padding: 0.5mm 0mm; width: 145mm; height: 4mm;">Add lines 23 through 26
            		<span class="styBoldText">
            		    <span style="width: 5px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.		    
            		    <span style="width: 11px;"></span>.                    
            		    <span style="width: 11px;"></span>.                    
            		</span>
            		</div>
            		<xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">27</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 1mm 0.5mm 0mm 0mm; width: 26mm; height: 4mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 0.5mm 0mm 0mm; height: 4mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/TentativeForeignTaxCreditAmt"/>
					    </xsl:call-template>
            </div>
						<!-- (28) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 4mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 8mm; height: 4mm; text-align: left; padding-left: 5px;">28</div>
							<div class="styIRS1116LNDesc" style="padding: 0.5mm 0mm; width: 145mm; height: 4mm;">Enter the <b>smaller</b> of line 20 or line 27
						<span class="styBoldText">
								<span style="width: 5px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
								<span style="width: 11px;"></span>.
						</span>
                    </div>
                    <xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">28</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 1mm 0.5mm 0mm 0mm; width: 26mm; height: 4mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 0.5mm 0mm 0mm; height: 4mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/SmllrOfRtnTaxOrForeignTaxCrAmt"/>
					    </xsl:call-template>
            </div>
						<!-- (29) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 4mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 8mm; height: 4mm; text-align: left; padding-left: 5px;">29</div>
							<div class="styIRS1116LNDesc" style="padding: 0.5mm 0mm; width: 145mm; height: 4mm;">
						Reduction of credit for international boycott operations. See instructions for line 12
						<span class="styBoldText">								
						<span style="width: 9px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						<span style="width: 11px;"></span>.                    
						</span>
						</div>
						<xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">29</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 1mm 0.5mm 0mm 0mm; width: 26mm; height: 4mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 0.5mm 0mm 0mm; height: 4mm; border-right-width: 0px;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/IntlBoycottCreditReductionAmt"/>
						    </xsl:call-template>
                </div>
						<!-- (30) ////////////////////////////////////////////////////-->
						<div class="styIRS1116LineItem" style="width: 187mm; height: 8mm;">
							<div class="styIRS1116LNLeftNumBox" style="width: 8mm; height: 8mm; text-align: left; padding-left: 5px;">30</div>
							<div class="styIRS1116LNDesc" style="padding: 0.5mm 0mm; width: 145mm; height: 8mm;">
				  Subtract line 29 from line 28. This is your <b>foreign tax credit.</b> Enter here and on Form 1040, line 48;<br/>
                  Form 1040NR, line 46; Form 1041, Schedule G, line 2; or Form 990-T, line 40a
				<span class="styBoldText">
					<span style="width: 5px;"></span>.
                    <span style="width: 11px;"></span>.
                    <span style="width: 11px;"></span>.
                    <span style="width: 11px;"></span>.
                    <span style="width: 11px;"></span>.
                    <span style="width: 11px;"></span>.
                    <span style="width: 11px;"></span>.
                    <span style="width: 11px;"></span>.
                    <span style="width: 11px;"></span>.
                    <span style="width: 5px;"></span>
                    <span><img src="{$ImagePath}/1116_Bullet_Sm.gif" alt="SmallBullet"/></span>
                  </span>
                </div>
                <xsl:call-template name="CreateBoxLine7">
                <xsl:with-param name="Number">30</xsl:with-param>
                <xsl:with-param name="AmountBoxStyle">padding: 5mm 0.5mm 0mm 0mm; width: 26mm; height: 8mm; text-align: right; font-size: 6.5pt; border-right-width: 0px;border-bottom-width:0;</xsl:with-param>
                <xsl:with-param name="NumberBoxStyle">padding: 5mm 0mm 0mm; height: 8mm; border-right-width: 0px;border-bottom-width:0;</xsl:with-param>
                <xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxCreditAmt"/>
                </xsl:call-template>
            </div>
          </div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm; height:auto; padding-top:1mm; clear: left; float: left;">
						<div style="float:right;">
							<span style="width:50px;"/>Form 
                            <span class="styBoldText" style="font-size:8pt;">1116</span> (2015)
                        </div>
                        <p style="width: 187mm; height: 4mm; page-break-before: always;"></p> 
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="clear: all; float: left;">
						<div class="styLeftOverTitle">
						  Additional Data        
					    </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl" style="clear: left; float: left;">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1116Data"/>
							<xsl:with-param name="DescWidth" select="130"/>
						</xsl:call-template>
						<xsl:if test="$Form1116Data/AlternativeMinimumTaxCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Left Margin - Alternative Minimum Tax Code</xsl:with-param>
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
						<xsl:if test="$Form1116Data/ForeignTaxAvailableForCrRedAmt/@foreignIncHighTaxKickOutAdjAmt">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part III, Line 13 - Foreign Income High Tax Kick Out Adjustment Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxAvailableForCrRedAmt/@foreignIncHighTaxKickOutAdjAmt"/>
								<xsl:with-param name="DescWidth" select="130"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$Form1116Data/ForeignTaxAvailableForCrRedAmt/@foreignIncHighTaxKickOutAdjCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part III, Line 13 - Foreign Income High Tax Kick Out Adjustment Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1116Data/ForeignTaxAvailableForCrRedAmt/@foreignIncHighTaxKickOutAdjCd"/>
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
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
              Form 1116, Part II - Foreign Taxes Paid or Accrued
            </span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead" style="border-top-width:1px;">
								<xsl:call-template name="CreatePartIITableHeaders">
									<xsl:with-param name="AddColoredHeaders">true</xsl:with-param>
								</xsl:call-template>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form1116Data/ForeignTaxCreditSource">
									<xsl:variable name="Letter">
										<xsl:number format="A"/>
									</xsl:variable>
									<xsl:call-template name="CreatePartIITableRows">
										<xsl:with-param name="AddColorCodeRow">true</xsl:with-param>
										<xsl:with-param name="RowLetter">
											<xsl:value-of select="$Letter"/>
										</xsl:with-param>
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
