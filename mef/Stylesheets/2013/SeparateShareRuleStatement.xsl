<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/SeparateShareRuleStatement" />
  
  <!-- Template to display Separate Share Rule Statement-->  
  
  <xsl:template name="BeneficiaryGrpTmp">
	<xsl:variable name="BenGrpCount" select="count($DependencyData/BeneficiaryGrp)"></xsl:variable>
  
	<xsl:call-template name="BenGrpLoop">
					<xsl:with-param name="bengrpcount" select="$BenGrpCount"/>
					<xsl:with-param name="bengrpiterations" select="'1'"/>
	</xsl:call-template>
  
  </xsl:template>
  
  <xsl:template name="BenGrpLoop">
	<xsl:param name="bengrpiterations"/>
	<xsl:param name="bengrpcount"/>
	<xsl:param name="columncheck" select="$bengrpcount + 1 - $bengrpiterations"/>
	<xsl:param name="columnwidth">
		<xsl:choose>
			  <xsl:when test="$columncheck = '5'">45.6</xsl:when>
			  <xsl:when test="$columncheck = '4'">57</xsl:when>
			  <xsl:when test="$columncheck = '3'">76</xsl:when>
			  <xsl:when test="$columncheck = '2'">114</xsl:when>
			  <xsl:when test="$columncheck = '1'">228</xsl:when>
			  <xsl:otherwise>38</xsl:otherwise>
		</xsl:choose>
	</xsl:param>					
  <xsl:if test="$bengrpiterations &lt; $bengrpcount or $bengrpiterations = $bengrpcount">
  <xsl:if test="$bengrpiterations = 1 or $bengrpiterations mod 6 = 1">  
    <table id="BeneficiaryGrpTbl" class="styDepTblLandscape">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">          
           <th class="styDepTblCell" scope="col" style="width:28mm;"> </th>      
           <th class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:left;">
			   <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/BeneficiaryFullName/PersonFirstName)[$bengrpiterations]"/>
				</xsl:call-template><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/BeneficiaryFullName/PersonLastName)[$bengrpiterations]"/>
				</xsl:call-template></th>
			<xsl:if test="$columncheck &gt; '1'">
            <th class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:left;">
			   <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/BeneficiaryFullName/PersonFirstName)[$bengrpiterations+1]"/>
				</xsl:call-template><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/BeneficiaryFullName/PersonLastName)[$bengrpiterations+1]"/>
				</xsl:call-template></th>
				</xsl:if>
				<xsl:if test="$columncheck &gt; '2'">
				 <th class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:left;">
			   <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/BeneficiaryFullName/PersonFirstName)[$bengrpiterations+2]"/>
				</xsl:call-template><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/BeneficiaryFullName/PersonLastName)[$bengrpiterations+2]"/>
				</xsl:call-template></th> 
				</xsl:if>
				<xsl:if test="$columncheck &gt; '3'">
				 <th class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:left;">
			   <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/BeneficiaryFullName/PersonFirstName)[$bengrpiterations+3]"/>
				</xsl:call-template><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/BeneficiaryFullName/PersonLastName)[$bengrpiterations+3]"/>
				</xsl:call-template></th>
				</xsl:if>
				<xsl:if test="$columncheck &gt; '4'">
				 <th class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:left;">
			   <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/BeneficiaryFullName/PersonFirstName)[$bengrpiterations+4]"/>
				</xsl:call-template><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/BeneficiaryFullName/PersonLastName)[$bengrpiterations+4]"/>
				</xsl:call-template></th>
				</xsl:if>
				<xsl:if test="$columncheck &gt; '5'">
				 <th class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:left;">
			   <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/BeneficiaryFullName/PersonFirstName)[$bengrpiterations+5]"/>
				</xsl:call-template><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/BeneficiaryFullName/PersonLastName)[$bengrpiterations+5]"/>
				</xsl:call-template></th>
				</xsl:if>  
        </tr>
      </thead>
      <tr>          
           <td class="styDepTblCell" scope="col" style="width:28mm;">SSN</td>        
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;">
				<xsl:call-template name="PopulateSSN">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/SSN)[$bengrpiterations]"/>
				</xsl:call-template>           
           </td>
			<xsl:if test="$columncheck &gt; '1'">  
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;">
				<xsl:call-template name="PopulateSSN">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/SSN)[$bengrpiterations+1]"/>
				</xsl:call-template>           
           </td>
           </xsl:if>
				<xsl:if test="$columncheck &gt; '2'">
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;">
				<xsl:call-template name="PopulateSSN">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/SSN)[$bengrpiterations+2]"/>
				</xsl:call-template>           
           </td>
           </xsl:if>
				<xsl:if test="$columncheck &gt; '3'">
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;">
				<xsl:call-template name="PopulateSSN">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/SSN)[$bengrpiterations+3]"/>
				</xsl:call-template>           
           </td>
           </xsl:if>
				<xsl:if test="$columncheck &gt; '4'">
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;">
				<xsl:call-template name="PopulateSSN">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/SSN)[$bengrpiterations+4]"/>
				</xsl:call-template>           
           </td>
           </xsl:if>
				<xsl:if test="$columncheck &gt; '5'">
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;">
				<xsl:call-template name="PopulateSSN">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/SSN)[$bengrpiterations+5]"/>
				</xsl:call-template>           
           </td>  
           </xsl:if>
        </tr>
        <tr>          
           <td class="styDepTblCell" scope="col" style="width:28mm;">AGI</td>        
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/AdjustedTotalIncomeAmt)[$bengrpiterations]"/>
				</xsl:call-template>
			</td>  
				<xsl:if test="$columncheck &gt; '1'">
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/AdjustedTotalIncomeAmt)[$bengrpiterations+1]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '2'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/AdjustedTotalIncomeAmt)[$bengrpiterations+2]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '3'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/AdjustedTotalIncomeAmt)[$bengrpiterations+3]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '4'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/AdjustedTotalIncomeAmt)[$bengrpiterations+4]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '5'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/AdjustedTotalIncomeAmt)[$bengrpiterations+5]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
        </tr>
        <tr>          
           <td class="styDepTblCell" scope="col" style="width:28mm;">Adjusted tax-exempt interest</td>        
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/AdjustedTaxExemptInterestAmt)[$bengrpiterations]"/>
				</xsl:call-template>
			</td>  
				<xsl:if test="$columncheck &gt; '1'">
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/AdjustedTaxExemptInterestAmt)[$bengrpiterations+1]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '2'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/AdjustedTaxExemptInterestAmt)[$bengrpiterations+2]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '3'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/AdjustedTaxExemptInterestAmt)[$bengrpiterations+3]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '4'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/AdjustedTaxExemptInterestAmt)[$bengrpiterations+4]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '5'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/AdjustedTaxExemptInterestAmt)[$bengrpiterations+5]"/>
				</xsl:call-template>
			</td> 
			</xsl:if>
        </tr>
        <tr>          
           <td class="styDepTblCell" scope="col" style="width:28mm;">Schedule D (Form 1041) Net Gain</td>        
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/TotalNetGainOrLossAmt)[$bengrpiterations]"/>
				</xsl:call-template>
			</td> 
				<xsl:if test="$columncheck &gt; '1'"> 
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/TotalNetGainOrLossAmt)[$bengrpiterations+1]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '2'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/TotalNetGainOrLossAmt)[$bengrpiterations+2]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '3'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/TotalNetGainOrLossAmt)[$bengrpiterations+3]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '4'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/TotalNetGainOrLossAmt)[$bengrpiterations+4]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '5'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/TotalNetGainOrLossAmt)[$bengrpiterations+5]"/>
				</xsl:call-template>
			</td> 
			</xsl:if> 
        </tr>
        <tr>          
           <td class="styDepTblCell" scope="col" style="width:28mm;">Schedule A Line 4 (minus 1202 exclusion)</td>        
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/CapGainAllocatedCorpusAmt)[$bengrpiterations]"/>
				</xsl:call-template>
           </td>  
				<xsl:if test="$columncheck &gt; '1'">
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/CapGainAllocatedCorpusAmt)[$bengrpiterations+1]"/>
				</xsl:call-template>
           </td>
           </xsl:if>
				<xsl:if test="$columncheck &gt; '2'">
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/CapGainAllocatedCorpusAmt)[$bengrpiterations+2]"/>
				</xsl:call-template>
           </td>
           </xsl:if>
				<xsl:if test="$columncheck &gt; '3'">
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/CapGainAllocatedCorpusAmt)[$bengrpiterations+3]"/>
				</xsl:call-template>
           </td>
           </xsl:if>
				<xsl:if test="$columncheck &gt; '4'">
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/CapGainAllocatedCorpusAmt)[$bengrpiterations+4]"/>
				</xsl:call-template>
           </td>
           </xsl:if>
				<xsl:if test="$columncheck &gt; '5'">
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/CapGainAllocatedCorpusAmt)[$bengrpiterations+5]"/>
				</xsl:call-template>
           </td>  
           </xsl:if>
        </tr>
        <tr>          
           <td class="styDepTblCell" scope="col" style="width:28mm;">Capital Gains included in Schedule A Line 1</td>        
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/TotalCapitalDistributionsAmt)[$bengrpiterations]"/>
				</xsl:call-template>
			</td>  
				<xsl:if test="$columncheck &gt; '1'">
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/TotalCapitalDistributionsAmt)[$bengrpiterations+1]"/>
				</xsl:call-template>
			</td> 
			</xsl:if>
				<xsl:if test="$columncheck &gt; '2'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/TotalCapitalDistributionsAmt)[$bengrpiterations+2]"/>
				</xsl:call-template>
			</td> 
			</xsl:if>
				<xsl:if test="$columncheck &gt; '3'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/TotalCapitalDistributionsAmt)[$bengrpiterations+3]"/>
				</xsl:call-template>
			</td> 
			</xsl:if>
				<xsl:if test="$columncheck &gt; '4'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/TotalCapitalDistributionsAmt)[$bengrpiterations+4]"/>
				</xsl:call-template>
			</td> 
			</xsl:if>
				<xsl:if test="$columncheck &gt; '5'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/TotalCapitalDistributionsAmt)[$bengrpiterations+5]"/>
				</xsl:call-template>
			</td>   
			</xsl:if>
        </tr>
        <tr>          
           <td class="styDepTblCell" scope="col" style="width:28mm;">Capital  (Gain) Or Loss*</td>        
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/CapitalGainAmt)[$bengrpiterations]"/>
				</xsl:call-template>
			</td>  
				<xsl:if test="$columncheck &gt; '1'">
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/CapitalGainAmt)[$bengrpiterations+1]"/>
				</xsl:call-template>
			</td> 
			</xsl:if>
				<xsl:if test="$columncheck &gt; '2'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/CapitalGainAmt)[$bengrpiterations+2]"/>
				</xsl:call-template>
			</td> 
			</xsl:if>
				<xsl:if test="$columncheck &gt; '3'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/CapitalGainAmt)[$bengrpiterations+3]"/>
				</xsl:call-template>
			</td> 
			</xsl:if>
				<xsl:if test="$columncheck &gt; '4'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/CapitalGainAmt)[$bengrpiterations+4]"/>
				</xsl:call-template>
			</td> 
			</xsl:if>
				<xsl:if test="$columncheck &gt; '5'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/CapitalGainAmt)[$bengrpiterations+5]"/>
				</xsl:call-template>
			</td>  
			</xsl:if> 
        </tr>
        <tr>          
           <td class="styDepTblCell" scope="col" style="width:28mm;">Distributable Net Income (DNI)</td>        
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/DistributableNetIncomeAmt)[$bengrpiterations]"/>
				</xsl:call-template>
			</td> 
				<xsl:if test="$columncheck &gt; '1'"> 
           <td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/DistributableNetIncomeAmt)[$bengrpiterations+1]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '2'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/DistributableNetIncomeAmt)[$bengrpiterations+2]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '3'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/DistributableNetIncomeAmt)[$bengrpiterations+3]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '4'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/DistributableNetIncomeAmt)[$bengrpiterations+4]"/>
				</xsl:call-template>
			</td>
			</xsl:if>
				<xsl:if test="$columncheck &gt; '5'">
			<td class="styDepTblCell" scope="col" style="width:[$columnwidth]mm;text-align:right;">
			   <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="($DependencyData/BeneficiaryGrp/DistributableNetIncomeAmt)[$bengrpiterations+5]"/>
				</xsl:call-template>
			</td>
			</xsl:if>	   
        </tr>
    </table>
    <xsl:if test="$columncheck &lt; '7'">
    <div style="width:256mm;text-align:center;">*For Capital (Gain) or Loss row, Gains are entered as a negative number and Losses are entered as a positive number.<br /><br /><br /></div> 
    </xsl:if>
    <xsl:if test="$columncheck &gt; '6'">
    <div style="width:256mm;text-align:center;page-break-after:always;">*For Capital (Gain) or Loss row, Gains are entered as a negative number and Losses are entered as a positive number.<br /><br /><br /></div> 
    </xsl:if>           
    </xsl:if>  
    <xsl:call-template name="BenGrpLoop">
		<xsl:with-param name="bengrpiterations" select="$bengrpiterations + 1"/>
		<xsl:with-param name="bengrpcount" select="$bengrpcount"/>
	</xsl:call-template>    
    </xsl:if>    
  </xsl:template>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title><xsl:value-of select="$depDocTitle" /></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
         <meta name="Author" content="" />
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
        <xsl:call-template name="DocumentHeaderDependencyLandscape"></xsl:call-template>    
        <div class="styDepTitleLineLandscape ">
          <span class="styDepTitle" style="width:95mm">
            <xsl:value-of select="$depDocTitle" />        
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>        
        <xsl:call-template name="BeneficiaryGrpTmp" />          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







