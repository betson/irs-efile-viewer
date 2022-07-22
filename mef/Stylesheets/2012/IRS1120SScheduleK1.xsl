<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120SScheduleK1Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1120SScheduleK1"/>
	<xsl:template name="RowWriterCore">
	<!-- Updated 05/07/2012 (CJ) R8_D2 -->
		<tr>
			<td class="styLeftNumBox">
				<span style="width:1px;"/>
			</td>
			<td height="10px;" style="height:4.5mm;font-size:7pt;text-align:left;width:172mm;" class="styIRS1120SScheduleK1BBtable">
				<span style="width:1px;"/>
			</td>
		</tr>
	</xsl:template>
	<!-- This template is called to fill in blank filler rows in Part III where multiple of rows of data -->
	<!-- may be applicable. The parameter NumOfTotRows is the set number of rows required to display on the page -->
	<!-- even if no data is populated. The parameter CurrentRowCount is the current number of rows already -->
	<!-- populated with data or blank row(s). When this template is called, a new blank row is populated in the -->
	<!-- form and the CurrentRowCount is incremented by 1. It will keep popoulating blank rows as long as -->
	<!-- CurrentRowCount is less than NumOfTotRows and stop when these two numbers are equal. -->
	<xsl:template name="AddBlankFillerRows">
		<xsl:param name="NumOfTotRows"/>
		<xsl:param name="CurrentRowCount"/>
		<!-- Test condition to populate a blank row -->
		<xsl:if test="$CurrentRowCount &lt; $NumOfTotRows">
			<!-- Recursive call to itself after incrementing the CurrentRowCount. -->
			<xsl:call-template name="AddBlankFillerRows">
				<xsl:with-param name="NumOfTotRows" select="$NumOfTotRows"/>
				<xsl:with-param name="CurrentRowCount" select="$CurrentRowCount + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- This template displays tables populated with data of the CodeAndAmountType data types      -->
	<!-- The data is displayed in a dependency data style table. There is an optional parameter     -->
	<!-- that indicates whether to display the associated push pin that comes from the Code element -->
	<!-- By default, this field is set to false unless the caller set it to true.                   -->
	<xsl:template name="DisplayCodeAndAmountTable">
		<xsl:param name="TargetNode"/>
		<xsl:param name="CodeAndAmountTableTitle"/>
			<xsl:param name="DisplayPushPin">false</xsl:param>
		<xsl:if test="count($TargetNode) &gt; 0">
			<br/>
			<span class="styRepeatingDataTitle">
				<xsl:value-of select="$CodeAndAmountTableTitle"/>
			</span>
			<table class="styDepTbl" style="font-size:7pt;">
				<thead class="styTableTHead">
					<tr class="styDepTblHdr">
						<th class="styDepTblCell" scope="col">Code</th>
						<th class="styDepTblCell" scope="col">Amount</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="$TargetNode">
						<tr>
							<!--Define background colors to the rows -->
							<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							<!--First column -->
							<td class="styDepTblCell" style="text-align:left;width:50mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="Code"/>
								</xsl:call-template>
							<xsl:choose>
							  <xsl:when test="$DisplayPushPin = 'true'">
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="Code"/>
                  </xsl:call-template>
							  </xsl:when>
							  </xsl:choose>
							</td>														
							<!-- Second Column -->
									<td class="styDepTblCell" style="text-align:right;padding-right:62mm;width:136mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Amount"/>
										</xsl:call-template>
									</td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- This template displays a line or lines of data for the IRS1120S Schedule K1 Part III Code/Amount fields -->
	<!-- If the number of data elements exceed the specified number of allowable lines, and the print option is -->
	<!-- set to separated, then a message is displayed indicating that the data is in an additional data table. -->
	<xsl:template name="DisplayPart3CodeAmountLine">
		<xsl:param name="TargetNode"/>
		<xsl:param name="NumOfTotalRows"/>
		<xsl:choose>
			<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
			<!-- If the print parameter is separated, but there are fewer elements than the container height  -->
			<xsl:when test="($Print != $Separated) or (count($TargetNode) &lt;= $NumOfTotalRows) ">
			  	 <xsl:for-each select="$TargetNode">
        <tr>
					<td style="font-size:7pt;font-family:Verdana;width:6.75mm;height:8mm;vertical-align:bottom;padding-bottom:2px;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Code"/>
					  </xsl:call-template>
			    </td>
			    <td colspan="2" style="vertical-align:bottom;font-size:7pt;font-family:Verdana;float:right;width:41.5mm;border-bottom:1px solid lightgrey;text-align:right;height:8mm;padding-bottom:2px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="Amount"/>
						</xsl:call-template>
				  </td>
				 </tr>
				</xsl:for-each>
				<!-- Add blank rows -->
				<xsl:call-template name="AddBlankFillerRows">
					<xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
					<xsl:with-param name="CurrentRowCount" select="count($TargetNode)"/>
				</xsl:call-template>
			</xsl:when>
			<!-- For separated print where the number of data elements exceed container height, -->
			<!-- display message directing user to additional data table. -->
			<xsl:otherwise>
        <tr>
          <td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
            <span class="styTableCellPad"/>
          </td>
          <td colspan="2" style="float:right;font-size:7pt;width:41.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:left;padding-left:1px;">
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
            </xsl:call-template>
          </td>
        </tr>
				<!-- Add blank rows -->
				<xsl:call-template name="AddBlankFillerRows">
					<xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
					<xsl:with-param name="CurrentRowCount" select="1"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
<!-- This template is the same as DisplayPart3CodeAmountLine with additional display of the pushpin in the amount field. -->
	<!-- This template displays a line or lines of data for the IRS1120S Schedule K1 Part III Line 10 Code/Amount fields     -->
	<!-- If the number of data elements exceed the specified number of allowable lines, and the print option is              -->
	<!-- set to separated, then a message is displayed indicating that the data is in an additional data table.              -->
		<xsl:template name="DisplayPart3CodeAmountAddlDataLine">
		<xsl:param name="TargetNode"/>
		<xsl:param name="NumOfTotalRows"/>
		<xsl:choose>
			<!-- Display all rows: If the print parameter is not set to be Separated, OR -->
			<!-- If the print parameter is separated, but there are fewer elements than the container height  -->
			<xsl:when test="($Print != $Separated) or (count($TargetNode) &lt;= $NumOfTotalRows) ">
			  	 <xsl:for-each select="$TargetNode">
        <tr>
					<td style="font-size:7pt;font-family:Verdana;width:6.75mm;height:8mm;vertical-align:bottom;padding-bottom:2px;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="Code"/>
					  </xsl:call-template>
			    </td>
			    <td style="border-bottom:1px solid lightgrey;width:5mm;height:8mm;text-align:left;padding-left:2px;">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="Code"/>
              </xsl:call-template>
			    </td>
			    <td style="vertical-align:bottom;font-size:7pt;font-family:Verdana;float:right;width:41.5mm;border-bottom:1px solid lightgrey;text-align:right;height:8mm;padding-bottom:2px;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="Amount"/>
						</xsl:call-template>
				  </td>
				 </tr>
				</xsl:for-each>
				<!-- Add blank rows -->
				<xsl:call-template name="AddBlankFillerRows">
					<xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
					<xsl:with-param name="CurrentRowCount" select="count($TargetNode)"/>
				</xsl:call-template>
			</xsl:when>
			<!-- For separated print where the number of data elements exceed container height, -->
			<!-- display message directing user to additional data table. -->
			<xsl:otherwise>
        <tr>
          <td style="width:5mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
            <span class="styTableCellPad"/>
          </td>
          <td colspan="2" style="float:right;font-size:7pt;width:41.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:left;padding-left:1px;">
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
            </xsl:call-template>
          </td>
        </tr>
				<!-- Add blank rows -->
				<xsl:call-template name="AddBlankFillerRows">
					<xsl:with-param name="NumOfTotRows" select="$NumOfTotalRows"/>
					<xsl:with-param name="CurrentRowCount" select="1"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1120SScheduleK1"/>
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<!-- Comment out out for separate print -->
        <xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS1120SScheduleK1Style"/>
					<xsl:call-template name="AddOnStyle"/>
        </xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<!-- Standard Header -->
				<xsl:call-template name="DocumentHeader"/>
				<!-- Form Display Starts Here -->
				<!--
                    +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    |  Top row: td   (6711)                                              
                    |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    |  Second row: td  (checkboxes)                             
                    |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    |  Middle row:                                                           
                    |  one td                             second td                       
                    |  +~~~~~~~~~~~~~~~~+ | +~~~~~~~~~~~~~~~~~  
                    |   |   with new table         with new tables      
                    |   |       Header                    header                  
                    |   |       Part I                        Part III                    
                    |   |       Part II                       +~~~~~~~~~~~~ 
                    |   |                                       | 1-12   |  13-17  
                    |   |                                       +~~~~~~~~~~~~ 
                    |  +~~~~~~~~~~~~~~~~+ |  +~~~~~~~~~~~~~~~~
                    |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    |  Bottom row: td                                                      
                    +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                -->
				<table width="186mm" border="0" cellpadding="0" cellspacing="0" style="font-family: Verdana; font-size: 7pt;">
					<tr>
						<td width="186mm" colspan="2" style="width: 186mm;">
							<span style="font-family: Courier New, monospace; font-size: 13pt; text-align: right; width: 186mm;">671112</span>
						</td>
					</tr>
					<tr>
						<td width="186mm" colspan="2" style="width: 186mm;">
							<span style="width: 186mm;">
								<span style="float: right; margin-bottom: 0.5mm;">
									<input alt="IRS1120SScheduleK1FinalK1" type="checkbox" class="styCkbox" name="checkbox" onclick="return false;">
					            <xsl:call-template name="PopulateCheckbox">
					              <xsl:with-param name="TargetNode" select="$FormData/FinalK1"/>
					              <xsl:with-param name="backupName">IRS1120SScheduleK1FinalK1</xsl:with-param>
					            </xsl:call-template>
									</input>
									<label>
							        <xsl:call-template name="PopulateLabel">
                                      <xsl:with-param name="TargetNode" select="$FormData/FinalK1"/>
							          <xsl:with-param name="BackupName">IRS1120SScheduleK1FinalK1</xsl:with-param>
							        </xsl:call-template>
										<span style="vertical-align: bottom;">Final K-1</span>
									</label>
									<span style="width: 11mm;"/>
									<input type="checkbox" class="styCkbox" name="checkbox" id="dummyID2"  onclick="return false;">
										<!-- No schema data to match this checkbox -->
									</input>
									<label style="vertical-align: bottom;" for="dummyID2">Amended K-1</label>
                  <span style="width: 11mm;"/>
                  OMB No. 1545-0130
								</span>
              </span>
            </td>
					</tr>
					<tr>
						<td style="width: 93mm;" valign="top">
							<table border="0" cellspacing="0" cellpadding="0" style="border-right: 1px solid black;">
								<!-- Inner table - Header, Part I, Part II -->
								<tr>
									<td style="width: 93mm;">
										<div style="width: 93mm;">
											<!-- Width necessary to prevent table from shrinking -->
											<span class="styFormNumber" style="font-size: 10pt;padding-top:2mm; float: left; clear: none;">Schedule K-1<br/>(Form 1120S)
											</span>
											<div class="styTY" style="float: right; clear: none; padding-right: 2mm;">20<span class="styTYColor">12</span>
											</div>
											<!-- 2012 -->
										</div>
									</td>
								</tr>
								<tr>
									<td style="font-size: 7pt;">
                                        Department of the Treasury<br/>
										<span style="float: left; clear: none;">Internal Revenue Service</span>
										<span style="float: right; clear: none; padding-right: 1mm;">For calendar year 2012, or tax <br/>year beginning
                                        <span style="width: 20mm; border-bottom: 1px solid black; text-align: center;">
                                         <xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
										</span>
										</span>
										<br/>
										<span style="float: left; clear:none;">
        										<xsl:call-template name="SetFormLinkInline">
        												<xsl:with-param name="TargetNode" select="$FormData"/>
        										</xsl:call-template>
        										  <!--General Dependency Push Pin 
     <xsl:call-template name="SetFormLinkInline">
       <xsl:with-param name="TargetNode" select="$FormData"/>
     </xsl:call-template>--> 
												<span style="width:2mm;"/>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Form 1120S Schedule K-1, Top Left Margin - Section 1377 (A)(2) Election Indicator</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/@sect1377a2Indicator"/>
												</xsl:call-template>
											</span>
										<span style="float: right; clear: both; padding-right: 1mm;">
										  ending
                                          <span style="width: 20mm; border-bottom: 1px solid black; text-align: center;">
                        <xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
										  </span>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span class="styMainTitle" style="font-size: 12pt;">Shareholder's Share of Income, Deductions,</span>
										<br/>
										<span class="styMainTitle" style="float: left; clear: none; font-size: 12pt;">Credits, etc.</span>
										<span style="float: right; clear: none; font-weight: bold; font-size: 7pt; padding-right: 1mm; padding-top: 0.5mm;">
											<img src="{$ImagePath}/1120SSchK1_Bullet.gif" width="4" height="7" alt="Right arrow image" border="0"/> See back of form and separate instructions.</span>
									</td>
								</tr>
								<tr>
									<td style="border-left: 2px solid black; border-top: 2px solid black; height: 8mm; background-color: lightgrey;">
										<!-- Part I header -->
										<span class="IRS1120SScheduleK1_partName" style="margin: 2mm;">Part I</span>
										<span class="IRS1120SScheduleK1_partDesc">Information About the Corporation</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 8mm;padding-bottom:0mm">
										<!-- Line A -->
										<span style="font-weight: bold;">A</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">Corporation's employer identification number</span>
										<br/>
										<span style="width: 5mm;"/>
                      <xsl:choose>
                        <xsl:when test="normalize-space($FormData/CorporationEIN)">                    
                          <xsl:call-template name="PopulateEIN">
                          <xsl:with-param name="TargetNode" select="$FormData/CorporationEIN"/>
                        </xsl:call-template>
                        <span style="width: 2px"/>
                        </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
                        </xsl:call-template>
                        <span style="width: 2px"/>
	    						      </xsl:otherwise>   
    						      </xsl:choose>
								</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 24mm;">
										<!-- Line B -->
										<span style="font-weight: bold;">B</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">Corporation's name, address, city, state, and ZIP code</span>
										<br/>
										<span style="width: 5mm;"/>
										<span style="width: 84mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:if test="not($FormData/CorporationName/BusinessNameLine2='' or not($FormData/CorporationName/BusinessNameLine2))">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/CorporationName/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:if>
											<br/>										
											<!-- Display Corporation US Address -->
                      <xsl:if test="$FormData/CorporationUSAddress and $FormData/CorporationUSAddress != ''">
                         <xsl:call-template name="PopulateUSAddressTemplate">
                      <xsl:with-param name="TargetNode" select="$FormData/CorporationUSAddress"/>
                         </xsl:call-template>
                      </xsl:if>
                      <!-- Display Corporation Foreign Address -->
                      <xsl:if test="$FormData/CorporationForeignAddress and $FormData/CorporationForeignAddress != ''">
                        <xsl:call-template name="PopulateForeignAddressTemplate">
                      <xsl:with-param name="TargetNode" select="$FormData/CorporationForeignAddress"/>
                        </xsl:call-template>
                      </xsl:if>
											</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 9mm;">
										<!-- Line C -->
										<span style="font-weight: bold;">C</span>
										<span style="width: 3mm;"/>
										<span style="width: 80mm;">IRS Center where corporation filed return</span>
										<br/>
										<span style="width: 5mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IRSServiceCenterWhereFiled"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 6mm; padding-bottom: 0px; padding-top: 0mm;background-color: lightgrey;">
										<!-- Part II header -->
										<span class="IRS1120SScheduleK1_partName" style="margin: 2mm;">Part II</span>
										<span class="IRS1120SScheduleK1_partDesc">Information About the Shareholder</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 8mm;padding-bottom:0mm">
										<!-- Line D -->
										<span style="font-weight: bold;">D</span>
										<span style="width: 3mm;"/>
             Shareholder's identifying number<br/>
										<span style="width: 5mm;"/>
										<!-- If EIN exists -->
										<xsl:if test="not($FormData/ShareholderEIN='' or not($FormData/ShareholderEIN))">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderEIN"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
										<!-- Else if SSN exists -->
										<xsl:if test="not($FormData/ShareholderSSN='' or not($FormData/ShareholderSSN))">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderSSN"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
										<!-- Else reason for no EIN/SSN -->
										<xsl:if test="not($FormData/MissingSSNEINReason='' or not($FormData/MissingSSNEINReason))">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/MissingSSNEINReason"/>
											</xsl:call-template>
											<br/>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 24mm;">
										<!-- Line E -->
										<span style="font-weight: bold;">E</span>
										<span style="width: 3mm;"/>
                     Shareholder's name, address, city, state, and ZIP code
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Form 1120S Schedule K-1, Line G - Shareholder Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/ShareholderNameControl"/>
										</xsl:call-template>
										<br/>
										<span style="width: 5mm;"/>
										<span style="width: 84mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:if test="not($FormData/ShareholderName/BusinessNameLine2='' or not($FormData/ShareholderName/BusinessNameLine2))">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/ShareholderName/BusinessNameLine2"/>
												</xsl:call-template>
												<br/>
											</xsl:if>
											<xsl:if test="$FormData/ShareholderUSAddress and $FormData/ShareholderUSAddress !=''">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="$FormData/ShareholderUSAddress"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="$FormData/ShareholderForeignAddress and $FormData/ShareholderForeignAddress !=''">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="$FormData/ShareholderForeignAddress"/>
												</xsl:call-template>
											</xsl:if>
										</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height: 12mm;">
										<!-- Line F -->
										<span style="font-weight: bold;">F</span>
										<span style="width: 3mm;"/>
										 Shareholder's percentage of stock<br/>
										<span style="width: 5.5mm; float: left; clear: none;"/>
										<span style="float: left;">ownership for tax year
									   <!--Dotted Line-->
                      <span class="styBoldText">
                        <span style="width:16px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:16px;"/>.
                        <span style="width:16px;"/>.
                         <span style="width:16px;"/>.
                      </span>
										</span>
										<span style="width: 18mm; border-bottom: 1px solid black; text-align: right; float: right; clear: none;">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="$FormData/PercentageStockOwnership"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
								<tr>
									<td class="IRS1120SScheduleK1_tdLeft" style="height:114mm; vertical-align: middle;">
										<!-- IRS Use Only box -->
										<img src="{$ImagePath}/1120SSchK1_For_IRS_Use_Only.gif" width="24" height="112" alt="For IRS Use Only" style="position: relative; left: -2mm;"/>
									</td>
								</tr>
							</table>
							<!-- End inner table - Header, Part I, Part II -->
						</td>
						<td width="93mm" style="width: 93mm;" valign="top">
							<table width="93mm" border="0" cellpadding="0" cellspacing="0" style="border-top: 2px solid black; border-bottom: 0px; border-left: 1px solid black; border-right: 2px solid black;">
								<!-- Inner table - Part III -->
								<tr>
									<td colspan="2">
										<!-- Part III header -->
										<table cellpadding="0" cellspacing="0">
											<tr>
												<td class="IRS1120SScheduleK1_tdPartName" style="width: 15mm;">
													<span class="IRS1120SScheduleK1_partName" style="vertical-align: top;">Part III</span>
												</td>
												<td class="IRS1120SScheduleK1_tdPartDesc">
													<span class="IRS1120SScheduleK1_partDesc">Shareholder's Share of Current Year Income, Deductions, Credits, and Other Items</span>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td valign="top">
										<table width="46.5mm" border="0" cellpadding="0" cellspacing="0" style="border-right: 1px solid black;"> 
											<!-- Part III columns 1-12 -->
                      <tr>
                        <td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<!-- Line 1 -->
													<div style="width: 46.5mm;">
														<span class="IRS1120SScheduleK1_itemLabel" style="text-align: center;width:5.3mm;">1</span>
														<span style="width:1mm"/>
														<span style="font-size: 6pt;">Ordinary business income (loss)</span>
														<br/>
                            <span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;"/>
														<span class="IRS1120SScheduleK1_amountBox" style="text-align: right;">
														<span style="float:left;padding-left:2px;">
														    <xsl:call-template name="SetFormLinkInline">
								                                               <xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncomeLoss"/>
								                                           </xsl:call-template>
                                                                                            </span>													
												            <span style="float:right;">
															<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="$FormData/OrdinaryIncomeLoss"/>
															</xsl:call-template>
														</span>
													  </span>
												</div>
											</td>
										</tr>
										<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<!-- Line 2 -->
													<div style="width: 46.5mm;">
														<span class="IRS1120SScheduleK1_itemLabel" style="text-align: center;width:5.3mm;">2</span>
														<span style="width:1mm"/>
														<span style="font-size: 6pt;">Net rental real estate income (loss)</span>								                
                            <br/>
                            <span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;"/>
														  <span class="IRS1120SScheduleK1_amountBox" style="text-align: right;">
														  <span style="float:left;padding-left:2px;">
														    <xsl:call-template name="SetFormLinkInline">
								                                              <xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossRealEstateAmount"/>
								                                            </xsl:call-template>
                                                                                          </span>														
													   <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossRealEstateAmount"/>
																</xsl:call-template>
													</span>
												      </span>
												</div>
											</td>
										</tr>
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<!-- Line 3 -->
													<div style="width: 46.5mm;">
														<span class="IRS1120SScheduleK1_itemLabel" style="text-align: center;width:5.3mm;">3</span>
														<span style="width:.5mm;"/>Other net rental income (loss)																												
														<br/>
                            <span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;"/>
														<span class="IRS1120SScheduleK1_amountBox" style="text-align: right;padding-bottom:1px;">
														<span style="float:left;padding-left:2px;">
														    <xsl:call-template name="SetFormLinkInline">
								                                               <xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossRentalAmount"/>
								                                            </xsl:call-template>
								                                         </span>
													       <span style="float:right;">
																<xsl:call-template name="PopulateAmount">
																	<xsl:with-param name="TargetNode" select="$FormData/NetIncomeLossRentalAmount"/>
																</xsl:call-template>
														 </span>
													</span>
												</div>
											    </td>
											</tr>
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
							<!-- Line 4 -->
													<div style="width: 46.5mm;">
														<span class="IRS1120SScheduleK1_itemLabel" style="text-align: center;width:5.3mm;">4</span>
														<span style="width:1mm"/>Interest income<br/>
														<span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;"/>
														<span class="IRS1120SScheduleK1_amountBox" style="text-align: right;padding-bottom:1px;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/InterestIncome"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
							<!-- Line 5a -->
													<div style="width: 46.5mm;">
														<span class="IRS1120SScheduleK1_itemLabel" style="text-align: right;width:5.3mm;">5a</span>
														<span style="width:1mm"/>Ordinary dividends<br/>
														<span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;"/>
														<span class="IRS1120SScheduleK1_amountBox" style="text-align: right;padding-bottom:1px;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/PortfolioIncmLossTotOrdnryDiv"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
						<!-- Line 5b -->
													<div style="width: 46.5mm;">
														<span class="IRS1120SScheduleK1_itemLabel" style="text-align: right;width:5.3mm;">5b</span>
														<span style="width:1mm"/>Qualified dividends<br/>
														<span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;"/>
														<span class="IRS1120SScheduleK1_amountBox" style="text-align: right;padding-bottom:1px;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/QualifiedDividends"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>
						<!-- Line 6 -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<div style="width: 46.5mm;">
														<span class="IRS1120SScheduleK1_itemLabel" style="text-align: center;width:5.3mm;">6</span>
														<span style="width:1mm;"/>Royalties<br/>
														<span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;"/>
														<span class="IRS1120SScheduleK1_amountBox" style="text-align: right;padding-bottom:1px;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/PortfolioIncomeLossRoyalties"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>
					<!-- Line 7 -->
											<tr>
												<td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<div style="width: 46.5mm;">
														<span class="IRS1120SScheduleK1_itemLabel" style="text-align: center;width:5.3mm;">7</span>
                            <span style="width:1mm;"/>
														<span style="font-size: 6pt;">Net short-term capital gain (loss)</span>
														<br/>
														<span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;"/>
														<span class="IRS1120SScheduleK1_amountBox" style="text-align: right;padding-bottom:1px;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainLoss"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>
											<tr>
                        <td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<!-- Line 8a -->
													<div style="width: 46.5mm;">
														<span class="IRS1120SScheduleK1_itemLabel" style="text-align: right;width:5.3mm;">8a</span>
														<span style="width:1mm"/>
														<span style="font-size: 6pt;">Net long-term capital gain (loss)</span>
														<br/>
														<span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;"/>
														<span class="IRS1120SScheduleK1_amountBox" style="text-align: right;padding-bottom:1px;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainLoss"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>
											<tr>
                        <td colspan="3" class="IRS1120SScheduleK1_tdRight">
													<!-- Line 8b -->
													<div style="width: 46.5mm;">
														<span class="IRS1120SScheduleK1_itemLabel" style="text-align: right;width:5.3mm;">8b</span>
														<span style="width:1mm"/>Collectibles (28%) gain (loss)<br/>
														<span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;"/>
														<span class="IRS1120SScheduleK1_amountBox" style="text-align: right;padding-bottom:1px;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="$FormData/CollectiblesGainLoss"/>
															</xsl:call-template>
														</span>
													</div>
												</td>
											</tr>

                      <tr>
                        <td colspan="3" class="IRS1120SScheduleK1_tdRight">
                          <!-- Line 8c -->
                          <div style="width: 46.5mm;">
                            <span class="IRS1120SScheduleK1_itemLabel" style="text-align:right;width:5.3mm;">8c</span>
                            <span style="width:1mm"/>
                            <span style="font-size: 6pt;">Unrecaptured section 1250 gain</span>
                            <br/>
                            <span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;"/>
                            <span class="IRS1120SScheduleK1_amountBox" style="text-align:right;">
                              <span style="float:left;padding-left:3px;width:5.3mm;">
                                <xsl:call-template name="SetFormLinkInline">
                                  <xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250Gain"/>
                                </xsl:call-template>
                              </span>
                              <span style="float:right;">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250Gain"/>
                                </xsl:call-template>
                              </span>
                            </span>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="3" class="IRS1120SScheduleK1_tdRight">
                          <!-- Line 9 -->
                          <div style="width: 46.5mm;">
                            <span class="IRS1120SScheduleK1_itemLabel" style="text-align: center;width:5.3mm;">9</span>
                            <span style="width:1mm"/>
                            Net section 1231 gain (loss)
                            <br/>
                            <span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;"/>
                            <span class="IRS1120SScheduleK1_amountBox" style="text-align:right;">
                              <span style="float:left;padding-left:2px;">
                                <xsl:call-template name="SetFormLinkInline">
                                  <xsl:with-param name="TargetNode" select="$FormData/NetSect1231GainLoss"/>
                                </xsl:call-template>
                              </span>
                              <span style="float:right;">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="$FormData/NetSect1231GainLoss"/>
                                </xsl:call-template>
                              </span>
                            </span>
                          </div>
                        </td>
                      </tr>
                      <!-- The horizontal line is not alignment properly because the length of content in the code box can be different. -->
                      <!-- Line 10 -->
                      <tr>
                        <td colspan="3" class="IRS1120SScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                          <div style="width: 46.5mm;">
                            <span class="IRS1120SScheduleK1_itemLabel" style="text-align:center;width:5.3mm;">10</span>
                            <span style="width:1mm"/>Other income (loss)
                            <br/>
                            <span class="IRS1120SScheduleK1_codeBox" style="border-bottom-width:0px;width:5.3mm;"/>
                            <span class="IRS1120SScheduleK1_amountBox" style="border-bottom-width:0px;"/>
                            <xsl:call-template name="DisplayPart3CodeAmountAddlDataLine">
                              <xsl:with-param name="TargetNode" select="$FormData/OtherIncomeLoss"/>
                              <xsl:with-param name="NumOfTotalRows" select="4"/>
                            </xsl:call-template>
                          </div>
                        </td>
                      </tr>
                      <!-- Line 11 -->
                      <tr>
                        <td colspan="3" class="IRS1120SScheduleK1_tdRight" style="height:4mm;">
                          <div style="width:46.5mm;">
                            <span class="IRS1120SScheduleK1_itemLabel" style="text-align:center;width:5.3mm;">11</span>
                            <span style="width:1mm"/>
                            Section 179 deduction
                            <br/>
                            <!-- Display a blank line if there are no data elements -->
                            <xsl:if test="count($FormData/Section179ExpenseDeduction) = 0 ">
                              <span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;border-bottom:0px;margin-top:0mm;"/>
                              <span class="IRS1120SScheduleK1_amountBox" style="border-bottom:0px;margin-top:0mm;"/>
                            </xsl:if>
                            <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
                            <!-- If the print parameter is separated, but there are fewer elements than the container height (1) -->
                            <xsl:if test="($Print != $Separated) or (count($FormData/Section179ExpenseDeduction) = 1) ">
                              <span class="IRS1120SScheduleK1_codeBox" style="width:5.3mm;"/>
                              <span class="IRS1120SScheduleK1_amountBox" style="text-align:right;">
                                <span style="float:left;padding-left:2.5px;">
                                  <xsl:call-template name="SetFormLinkInline">
                                    <xsl:with-param name="TargetNode" select="$FormData/Section179ExpenseDeduction"/>
                                  </xsl:call-template>
                                </span>
                                <span style="float:right;">
                                  <xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$FormData/Section179ExpenseDeduction"/>
                                  </xsl:call-template>
                                </span>
                              </span>
                            </xsl:if>
                          </div>
                        </td>
                      </tr>
                      <!-- Line 12 -->
                      <tr>
                        <td colspan="3" class="IRS1120SScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                          <div style="width: 46.5mm;">
                            <span class="IRS1120SScheduleK1_itemLabel" style="text-align:center;width:5.3mm;">12</span>
                            <span style="width:1mm"/>
                            Other deductions
                            <br/>
                            <span class="IRS1120SScheduleK1_codeBox" style="border-bottom:0px;margin-top:0mm;width:5.3mm;"/>
                            <span class="IRS1120SScheduleK1_amountBox" style="border-bottom:0px;margin-top:0mm;"/>
                            <br/>
                            <xsl:call-template name="DisplayPart3CodeAmountAddlDataLine">
                              <xsl:with-param name="TargetNode" select="$FormData/OtherDeductions"/>
                              <xsl:with-param name="NumOfTotalRows" select="7"/>
                            </xsl:call-template>
                          </div>
                        </td>
                      </tr>
										</table>
									</td>
<!-- Part III columns 13-17 -->								
									<td valign="top">
                    <table width="46.5mm" border="0" cellpadding="0" cellspacing="0" style="border-left: 1px solid black;">
                      <!-- Line 13 -->
                      <!-- There is a misalignment between the code box of line 13 and "*" in the print preview. It is an display issue of IE8 limitation -->
                      <tr>
                        <td colspan="3" class="IRS1120SScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                          <div style="width: 46.5mm;">
                            <span class="IRS1120SScheduleK1_itemLabel" style="text-align:center;width:5.2mm;">13</span>
                            Credits
                            <br/>
                            <span class="IRS1120SScheduleK1_codeBox" style="height:4mm;border-top:0px;width:5.2mm;"/>
                            <span class="IRS1120SScheduleK1_amountBox" style="height:4mm;border-top:0px;"/>
                            <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
                            <!-- If the print parameter is separated, but there are fewer elements than the container height (4) -->
                          </div>
                        </td>
                      </tr>
                      <xsl:call-template name="DisplayPart3CodeAmountAddlDataLine">
                        <xsl:with-param name="TargetNode" select="$FormData/Credits"/>
                        <xsl:with-param name="NumOfTotalRows" select="4"/>
                      </xsl:call-template>
                      <!-- Line 14 -->
                      <!-- There is a misalignment between the code box of line 14 and "A" in the print preview. It is an display issue of IE8 limitation -->
                      <tr>
                        <td colspan="4" class="IRS1120SScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                          <div style="width: 46.5mm;">
                            <span class="IRS1120SScheduleK1_itemLabel" style="text-align:center;width:5.2mm;">14</span>
                            Foreign transactions
                            <br/>
                            <span class="IRS1120SScheduleK1_codeBox" style="height: 1mm;text-align:center; width:5.2mm;"/>
                            <span class="IRS1120SScheduleK1_amountBox" style="height: 1mm;"/>
                            <br/>
                          </div>
                        </td>
                      </tr>
                      <xsl:choose>
                        <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
                        <!-- If the print parameter is separated, but there are fewer elements than the container height -->
                        <xsl:when test="($Print != $Separated) or (count($FormData/ForeignTransactions) &lt;= 6) ">
                          <xsl:for-each select="$FormData/ForeignTransactions">
                            <tr style="width:46.5mm;">
                              <xsl:choose>
                                <!-- If either CountryOrPossessionCode or CountryOrPossessionName element exists, -->
                                <!-- display Country/Possession Code + Country/Possession Name -->
                                <xsl:when test="CountryOrPossessionCode or CountryOrPossessionName">
                                  <td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="CountryOrPossessionCode"/>
                                    </xsl:call-template>
                                  </td>
                                  <td style="width:5mm;font-size:7pt;border-bottom:1px solid lightgrey;height:8mm;padding-top:4mm;text-align:left;padding-left:3px;">
                                    <xsl:call-template name="SetFormLinkInline">
                                      <xsl:with-param name="TargetNode" select="CountryOrPossessionCode"/>
                                    </xsl:call-template>
                                  </td>
                                  <td style="float:right;font-size:7pt;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:left;">
                                    <span style="width:4.4mm;float:left;">
                                      <xsl:call-template name="PopulateText">
                                        <xsl:with-param name="TargetNode" select="CountryOrPossessionName"/>
                                      </xsl:call-template>
                                    </span>
                                    <span style="width:32mm;float:right;text-align:right;">
                                      <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="Amount"/>
                                      </xsl:call-template>
                                    </span>
                                  </td>
                                  <!-- <td style="width:32mm;float:right;font-size:7pt;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:right;background-color:lightgreen;"> </td> -->
                                </xsl:when>
                                <!-- Otherwise, display Code -->
                                <xsl:otherwise>
                                  <td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
                                    <xsl:call-template name="PopulateText">
                                      <xsl:with-param name="TargetNode" select="Code"/>
                                    </xsl:call-template>
                                  </td>
                                  <td style="font-size:7pt;border-bottom:1px solid lightgrey;width:5mm;height:8mm;padding-top:4mm;text-align:left;padding-left:3px;">
                                    <xsl:call-template name="SetFormLinkInline">
                                      <xsl:with-param name="TargetNode" select="Code"/>
                                    </xsl:call-template>
                                  </td>
                                  <td style="float:right;font-size:7pt;width:38mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:right;">
                                    <xsl:call-template name="PopulateAmount">
                                      <xsl:with-param name="TargetNode" select="Amount"/>
                                    </xsl:call-template>
                                  </td>
                                </xsl:otherwise>
                              </xsl:choose>
                            </tr>
                          </xsl:for-each>
                          <!-- Add blank rows -->
                          <xsl:call-template name="AddBlankFillerRows">
                            <xsl:with-param name="NumOfTotRows" select="'6'"/>
                            <xsl:with-param name="CurrentRowCount" select="count($FormData/ForeignTransactions)"/>
                          </xsl:call-template>
                        </xsl:when>
                        <!-- For separated print where the number of data elements exceed container height, -->
                        <!-- display message directing user to additional data table. -->
                        <xsl:otherwise>
                          <tr>
                            <td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
                              <span class="styTableCellPad"/>
                            </td>
                            <td colspan="2" style="float:right;font-size:7pt;width:41.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:left;">
                              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                <xsl:with-param name="TargetNode" select="$FormData/ForeignTransactions"/>
                              </xsl:call-template>
                            </td>
                          </tr>
                          <xsl:call-template name="AddBlankFillerRows">
                            <xsl:with-param name="NumOfTotRows" select="'6'"/>
                            <xsl:with-param name="CurrentRowCount" select="1"/>
                          </xsl:call-template>
                        </xsl:otherwise>
                      </xsl:choose>
                      <!-- Line 15 -->
                      <!-- There is a misalignment between the code box of line 15 and "*" in the print preview. It is an display issue of IE8 limitation -->
                      <tr>
                        <td colspan="3" class="IRS1120SScheduleK1_tdRight">
                          <div style="width: 46.5mm;">
                            <span class="IRS1120SScheduleK1_itemLabel" style="text-align:center;width:5.2mm;">15</span>
                            <span style="font-size: 6pt;">Alternative minimum tax (AMT) items</span>
                            <span class="IRS1120SScheduleK1_codeBox" style="text-align:center;border-bottom:0px; margin-top:0mm;width:5.2mm;"/>
                            <span class="IRS1120SScheduleK1_amountBox" style="border-bottom:0px; margin-top:0mm;"/>
                            <br/>
                          </div>
                        </td>
                      </tr>
                      <xsl:choose>
                        <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
                        <!-- If the print parameter is separated, but there are fewer elements than the container height -->
                        <xsl:when test="($Print != $Separated) or (count($FormData/AMTItems) &lt;= 6) ">
                          <xsl:for-each select="$FormData/AMTItems">
                            <tr>
                              <td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="Code"/>
                                </xsl:call-template>
                              </td>
                              <td style="font-size:7pt;border-bottom:1px solid lightgrey;width:5mm;height:8mm;padding-top:4mm;text-align:left;padding-left:3px;">
                                <xsl:call-template name="SetFormLinkInline">
                                  <xsl:with-param name="TargetNode" select="Code"/>
                                </xsl:call-template>
                              </td>
                              <td style="float:right;font-size:7pt;width:36.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:right;">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="Amount"/>
                                </xsl:call-template>
                              </td>
                            </tr>
                          </xsl:for-each>
                          <!-- Add blank rows -->
                          <xsl:call-template name="AddBlankFillerRows">
                            <xsl:with-param name="NumOfTotRows" select="'6'"/>
                            <xsl:with-param name="CurrentRowCount" select="count($FormData/ForeignTransactions)"/>
                          </xsl:call-template>
                        </xsl:when>
                        <!-- For separated print where the number of data elements exceed container height, -->
                        <!-- display message directing user to additional data table. -->
                        <xsl:otherwise>
                          <tr>
                            <td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
                              <span class="styTableCellPad"/>
                            </td>
                            <td colspan="2" style="float:right;font-size:7pt;width:41.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:left;">
                              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                <xsl:with-param name="TargetNode" select="$FormData/AMTItems"/>
                              </xsl:call-template>
                            </td>
                          </tr>
                          <xsl:call-template name="AddBlankFillerRows">
                            <xsl:with-param name="NumOfTotRows" select="'6'"/>
                            <xsl:with-param name="CurrentRowCount" select="1"/>
                          </xsl:call-template>
                        </xsl:otherwise>
                      </xsl:choose>
                      <!-- Line 15 -->
                      <!-- Line 16 -->
                      <!-- There is a misalignment between the code box of line 16 and "*" in the print preview. It is an display issue of IE8 limitation -->
                      <tr>
                        <td colspan="3" class="IRS1120SScheduleK1_tdRight">
                          <div style="width: 46.5mm;">
                            <span class="IRS1120SScheduleK1_itemLabel" style="text-align:center;width:5.2mm;">16</span>
                            <span style="font-size: 6pt;">Items affecting shareholder basis</span>
                            <br/>
                            <span class="IRS1120SScheduleK1_codeBox" style=" border-bottom:0px; margin-top:0mm;width:5.2mm;"/>
                            <span class="IRS1120SScheduleK1_amountBox" style=" border-bottom:0px; margin-top:0mm;"/>
                            <br/>
                            <xsl:call-template name="DisplayPart3CodeAmountLine">
                              <xsl:with-param name="TargetNode" select="$FormData/ItemsAffectingShareholderBasis"/>
                              <xsl:with-param name="NumOfTotalRows" select="4"/>
                            </xsl:call-template>
                          </div>
                        </td>
                      </tr>
                      <!-- Line 17 -->
                      <!-- There is a misalignment between the code box of line 15 and "*" in the print preview. It is an display issue of IE8 limitation -->
                     <tr>
                        <td colspan="3" class="IRS1120SScheduleK1_tdRight" style="border-bottom:1px solid lightgrey;">
                          <div style="width: 46.5mm;">
                            <span class="IRS1120SScheduleK1_itemLabel" style="text-align:center;width:5.2mm;">17</span>
                            Other information
                            <br/>
                            <span class="IRS1120SScheduleK1_codeBox" style="height: 1mm;text-align:center; width:5.2mm;"/>
                            <span class="IRS1120SScheduleK1_amountBox" style="height: 1mm;"/>
                            <br/>
                          </div>
                        </td>
                      </tr>
                      <xsl:choose>
                        <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
                        <!-- If the print parameter is separated, but there are fewer elements than the container height -->
                        <xsl:when test="($Print != $Separated) or (count($FormData/OtherInformation) &lt;= 6) ">
                          <xsl:for-each select="$FormData/OtherInformation">
                            <tr>
                              <td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
                                <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="Code"/>
                                </xsl:call-template>
                              </td>
                              <td style="font-size:7pt;border-bottom:1px solid lightgrey;width:5mm;height:8mm;padding-top:4mm;text-align:left;padding-left:3px;">
                                <xsl:call-template name="SetFormLinkInline">
                                  <xsl:with-param name="TargetNode" select="Code"/>
                                </xsl:call-template>
                              </td>
                              <td style="float:right;font-size:7pt;width:36.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:right;">
                                <xsl:call-template name="PopulateAmount">
                                  <xsl:with-param name="TargetNode" select="Amount"/>
                                </xsl:call-template>
                              </td>
                            </tr>
                          </xsl:for-each>
                          <!-- Add blank rows -->
                          <xsl:call-template name="AddBlankFillerRows">
                            <xsl:with-param name="NumOfTotRows" select="'6'"/>
                            <xsl:with-param name="CurrentRowCount" select="count($FormData/ForeignTransactions)"/>
                          </xsl:call-template>
                        </xsl:when>
                        <!-- For separated print where the number of data elements exceed container height, -->
                        <!-- display message directing user to additional data table. -->
                        <xsl:otherwise>
                          <tr>
                            <td style="width:4.9mm;height:8mm;font-size:7pt;font-family:Verdana;border-right:1px solid black;border-bottom:1px solid lightgrey;text-align:center;border-left:0px;padding-top:4mm;">
                              <span class="styTableCellPad"/>
                            </td>
                            <td colspan="2" style="float:right;font-size:7pt;width:41.5mm;border-bottom:1px solid lightgrey;padding-top:4mm;text-align:left;">
                              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                                <xsl:with-param name="TargetNode" select="$FormData/OtherInformation"/>
                              </xsl:call-template>
                            </td>
                          </tr>
                          <xsl:call-template name="AddBlankFillerRows">
                            <xsl:with-param name="NumOfTotRows" select="'6'"/>
                            <xsl:with-param name="CurrentRowCount" select="1"/>
                          </xsl:call-template>
                        </xsl:otherwise>
                      </xsl:choose>
                      <!-- Line 17 -->
                      <!-- <tr> <td colspan="3" class="IRS1120SScheduleK1_tdRight"> <div style="width: 46.5mm;"> <span class="IRS1120SScheduleK1_itemLabel" style="text-align:center;">17</span>Other information<br/> <span class="IRS1120SScheduleK1_codeBox" style=" border-bottom:0px; margin-top:0mm;"/> <span class="IRS1120SScheduleK1_amountBox" 
                        style=" border-bottom:0px; margin-top:0mm;"/> <br/> <xsl:call-template name="SetFormLinkInline"> <xsl:with-param name="TargetNode" select="OtherInformation"> </xsl:with-param> </xsl:call-template> <xsl:call-template name="DisplayPart3CodeAmountLine"> <xsl:with-param name="TargetNode" select="$FormData/OtherInformation"/> 
                        <xsl:with-param name="NumOfTotalRows" select="3"/> </xsl:call-template> </div> </td> </tr> -->
                    </table>									</td>
								</tr>
								<tr>
									<td colspan="2" style="font-family: Verdana; font-size: 7pt; border-top: 2px solid black; text-align: center;">
            * See attached statement for additional information.
          </td>
								</tr>
							</table>
							<!-- End inner table - Part III -->
						</td>
					</tr>
					<tr>
						<td width="189mm" colspan="2" style="width: 189mm; font-family: Verdana; font-size: 6pt; font-weight: bold; border-top: 2px solid black;">
							<span style="width: 116mm;">For Paperwork Reduction Act Notice, see Instructions for Form 1120S.</span>
							<span style="font-weight: normal; width: 28mm;">Cat. No. 11520D</span>
							<span style="width: 43mm;">Schedule K-1 (Form 1120S) 2012</span>
						</td>
					</tr>
				</table>
				<!-- FORM DISPLAY STUFF  ENDS  HERE -->
				<br/>
				<br class="pageEnd"/>
				<!-- From 1120S form -->
				<!-- BEGIN Left Over Table -->
				<div class="styLeftOverTitleLine" id="LeftoverData">
					<div class="styLeftOverTitle">
          Additional Data        
          </div>
					<div class="styLeftOverButtonContainer">
						<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
					</div>
				</div>
				<table class="styLeftOverTbl">
					<xsl:call-template name="PopulateCommonLeftover">
						<xsl:with-param name="TargetNode" select="$FormData"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
			        <xsl:with-param name="Desc">Form 1120S Schedule K-1, Top Left Margin - Section 1377 (A)(2) Election Indicator</xsl:with-param>
			        <xsl:with-param name="TargetNode" select="$FormData/@sect1377a2Indicator"/>
			        <xsl:with-param name="DescWidth" select="100"/>
             </xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Form 1120S Schedule K-1, Line E - Shareholder Name Control</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ShareholderNameControl"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
				</table>
				<!-- END Left Over Table -->
				<!-- Additonal Data Table for separated data from Part III, Line 10 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/OtherIncomeLoss) &gt;4) ">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeLoss"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
            Form 1120S Schedule K1, Part III, Line 10 - Other income (loss):
            </xsl:with-param>
      			<xsl:with-param name="DisplayPushPin">true</xsl:with-param>						
					</xsl:call-template>
				</xsl:if>
				<!-- End Part III Line 10 separated data -->
				<!-- Additonal Data Table for separated data from Part III, Line 12 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/OtherDeductions) &gt; 7) ">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/OtherDeductions"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
            Form 1120S Schedule K1, Part III, Line 12 - Other deductions:
            </xsl:with-param>
      			<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- End Part III Line 12 separated data -->
				<!-- Additonal Data Table for separated data from Part III, Line 13 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/Credits) &gt; 4) ">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/Credits"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
            Form 1120S Schedule K1, Part III, Line 13 - Credits:
            </xsl:with-param>
      			<xsl:with-param name="DisplayPushPin">true</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- End Part III Line 13 separated data -->
				<!-- Additonal Data Table for separated data from Part III, Line 14 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/ForeignTransactions) &gt; 6) ">
          <br/>
          <span class="styRepeatingDataTitle">Form 1120S Schedule K1, Part III, Line 14 - Foreign transactions:</span>
          <table class="styDepTbl" style="font-size:7pt">
            <thead class="styTableTHead">
              <tr class="styDepTblHdr">
                <th class="styDepTblCell" scope="col">Country or Possession Code OR Code</th>
                <th class="styDepTblCell" scope="col">Country or Possession Name</th>
                <th class="styDepTblCell" scope="col">Amount </th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="$FormData/ForeignTransactions">
                <tr>
                  <!--Define background colors to the rows -->
                  <xsl:attribute name="class">
                    <xsl:choose>
                      <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                      <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <!-- If either CountryOrPossessionCode or CountryOrPossessionName element exists, -->
                  <!-- display Country/Possession Code + Country/Possession Name -->
                  <xsl:choose>
                    <xsl:when test="CountryOrPossessionCode or CountryOrPossessionName">
                      <!--First column -->
                      <td class="styDepTblCell" style="text-align:left;width:50mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CountryOrPossessionCode"/>
                        </xsl:call-template>
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="CountryOrPossessionCode"/>
                        </xsl:call-template>
                      </td>
                      <!--Second column -->
                      <td class="styDepTblCell" style="width:68mm;text-align:left;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CountryOrPossessionName"/>
                        </xsl:call-template>
                      </td>
                      <!--Third column -->
                      <td class="styDepTblCell" style="width:68mm;text-align:right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amount"/>
                        </xsl:call-template>
                      </td>
                    </xsl:when>
                    <!-- Otherwise, display Code + Amount -->
                    <xsl:otherwise>
                      <!--First Column -->
                      <td class="styDepTblCell" style="text-align:left;width:50mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="Code"/>
                        </xsl:call-template>
                        <xsl:call-template name="SetFormLinkInline">
                          <xsl:with-param name="TargetNode" select="Code"/>
                        </xsl:call-template>
                      </td>
                      <!--Second column -->
                      <td class="styDepTblCell" style="width:68mm;text-align:left;">
                        <span style="width:2mm;"/>
                      </td>
                      <!--Third Column -->
                      <td class="styDepTblCell" style="width:68mm;text-align:right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="Amount"/>
                        </xsl:call-template>
                      </td>
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
				</xsl:if>
				<!-- End Part III Line 14 separated data -->
				<!-- Additonal Data Table for separated data from Part III, Line 15 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/AMTItems) &gt; 4) ">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/AMTItems"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
            Form 1120S Schedule K1, Part III, Line 15 - Alternative minimum tax (AMT) items:
            </xsl:with-param>
      			<xsl:with-param name="DisplayPushPin">true</xsl:with-param>						      
					</xsl:call-template>			
				</xsl:if>
				<!-- End Part III Line 15 separated data -->
				<!-- Additonal Data Table for separated data from Part III, Line 16 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/ItemsAffectingShareholderBasis) &gt; 4) ">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/ItemsAffectingShareholderBasis"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
            Form 1120S Schedule K1, Part III, Line 16 - Items affecting shareholder basis:
            </xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<!-- End Part III Line 16 separated data -->
				<!-- Additonal Data Table for separated data from Part III, Line 17 -->
				<xsl:if test="($Print = $Separated) and (count($FormData/OtherInformation) &gt; 3) ">
					<xsl:call-template name="DisplayCodeAndAmountTable">
						<xsl:with-param name="TargetNode" select="$FormData/OtherInformation"/>
						<xsl:with-param name="CodeAndAmountTableTitle">
            Form 1120S Schedule K1, Part III, Line 17 - Other information:
            </xsl:with-param>
      			<xsl:with-param name="DisplayPushPin">true</xsl:with-param>						      
					</xsl:call-template>
				</xsl:if>
				<!-- End Part III Line 17 separated data -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
