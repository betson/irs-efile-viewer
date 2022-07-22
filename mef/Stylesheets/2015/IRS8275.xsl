<?xml version="1.0" encoding="UTF-8"?>
<!-- <?xml version="1.0" encoding="UTF-8"?> -->
<!-- NOTE 08/2011 KH: Defect Information on Separated Print.  This gets written up yearly. 
History to resolve ticket for future writeups:
This separated print problem goes back to 2010 with two problems.  See past tickets #24893 & 25652.
As per the stylesheet guidelines on Page 14:
Due to a Microsoft Internet Explorer print browser limitations, the printout of the style sheets 
will not exactly match the browser display of the style sheets.  The browser display of the 
style sheet has higher priority than its printed version. If a style sheets displays properly 
on the browser but prints incorrectly, the style sheets can be modified to correct the 
printing problem only to the extent that it does not distort the browser display.--><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8275Style.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:param name="Form8275Data" select="$RtnDoc/IRS8275"/>
<xsl:template match="/">
  <html>
    <head>
      <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8275Data)"/></xsl:call-template></title>
      <!-- No Browser Caching  -->
      <meta http-equiv="Pragma" content="no-cache"/>
      <meta http-equiv="Cache-Control" content="no-cache"/>
      <meta http-equiv="Expires" content="0"/>
      <!-- No Proxy Caching -->
      <meta http-equiv="Cache-Control" content="private"/>
      <!-- Define Character Set -->
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
      <meta name="Description" content="Form IRS8275"/>
      <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
      <xsl:call-template name="InitJS"/>
      <style type="text/css">    
        <xsl:if test="not($Print) or $Print=''">
          <xsl:call-template name="IRS8275Style"/>
          <xsl:call-template name="AddOnStyle"/>        
        </xsl:if>
      </style>
      <xsl:call-template name="GlobalStylesForm"/>
    </head>
    <body class="styBodyClass" style="width:187mm">
      <form name="Form8275">
        <!-- BEGIN WARNING LINE -->
        <xsl:call-template name="DocumentHeader"/>  
        <!-- END WARNING LINE -->
					<div style="width:187mm;height:22.5mm;" class="styTBB">
						<!-- changed height from 18mm -->
						<div style="width:30mm;height:22mm;" class="styFNBox">
						<!-- changed height from 20.5mm -->
							<div style="height:13.5mm;">Form<span class="styFormNumber" style="font-size: 18pt;">  8275</span>
								<br/>
								<div style="font-size:normal">(Rev. August 2013) </div>
								<br/>
							</div>
							<div style="height:5mm;padding-top:2mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:127mm;height:21mm;" >
						<!-- changed height from 20.5mm -->
							<div class="styMainTitle" style="height:6mm;padding-top:1mm;" >
						<!-- changed height from 4mm -->
								Disclosure Statement
							</div>
							<div class="styFST" style="height:7mm;font-size:7pt;font-weight: bold;">
							Do not use this form to disclose items or positions that are contrary to Treasury <br/>
							regulations. Instead, use Form 8275-R, Regulation Disclosure Statement.<br/>
								<span style="text-align:center;margin-left:0mm;font-size:6.5pt;">
									<img src="{$ImagePath}/8275_Bullet.gif" alt="Bullet Image"/> 
									Information about Form 8275 and its separate instructions is at 
									<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form8275" title="Link to IRS.gov">
                                                 <i>www.irs.gov/form8275</i></a>.
								</span>
								<br/>
								<!-- added break -->	
							<!--</div>					
							<div class="styFST">-->
								<img src="{$ImagePath}/8275_Bullet.gif" alt="Bullet Image"/>
									Attach to your tax return.
							</div>
						</div>
						<div style="width:30mm;height:22.5mm;" class="styTYBox">
							<div style="height:8mm;padding-top:2mm;padding-left:.5mm;" class="styOMB">
									OMB No. 1545-0889
						    </div>
							<div class="styOMB" style="height:10mm;border-bottom-width:0px;padding-top:1mm;text-align:left;padding-left:2mm;">
									Attachment <br/>
									Sequence No. <span class="styBoldText" style="font-size:9pt;">92</span>
							</div>
						</div>
					</div>
        <div style="width:187mm;" class="styBB">
          <div style="width:131mm;height:9mm;font-size:7pt;font-weight:normal;" class="styNameBox">
							<!-- changed height from 8mm -->
            Name(s) shown on return
				 <br/>
				<xsl:choose>
			  <!-- This process changed 170510 by gdy per UWR 194393 -->
				<!--Business Name from F1120 Return Header-->
				<xsl:when test="$RtnHdrData/Filer/BusinessName">
				  <xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
				  </xsl:call-template>
				</xsl:when>
				<!--Individual Name from F1040/NR Return Header-->
				<xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
					<br/>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
				  </xsl:call-template>
				</xsl:when>
				<!--Business Name from F1041 Return Header-->
				<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
				  <xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
				  </xsl:call-template>
				  <br/>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
				  </xsl:call-template>            
				</xsl:when>
				<!--National Morgage Association Code from F1041 Return Header-->
				<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
				<br/>
				  <xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">NationalMortgageAssocCd</xsl:with-param>
				  </xsl:call-template>
				</xsl:when>
			  </xsl:choose>
			  </div>
			  <div style="width:55mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;" class="styEINBox">
				Identifying number shown on return
				<span style="font-weight:normal;">
					<xsl:choose>
					  <!-- This process changed 170510 by gdy per UWR 194393 -->
					  <xsl:when test="$RtnHdrData/Filer/PrimarySSN">
					  <br/>
						 <xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
						 </xsl:call-template>
					  </xsl:when>
					  <xsl:when test="$RtnHdrData/Filer/SSN">
					  <br/>
						 <xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">SSN</xsl:with-param>
						 </xsl:call-template>
					  </xsl:when>
					  <xsl:when test="$RtnHdrData/Filer/EIN">
					  <br/>
						 <xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">EIN</xsl:with-param>
						 </xsl:call-template>
					  </xsl:when>
					  <xsl:otherwise>
					  </xsl:otherwise>
					</xsl:choose>
				</span>
          </div>
        </div>
        <!-- ****************************************************************************** -->
  <div style="width:187mm;">
       If Form 8275 relates to an information return for a foreign entity (for example, Form 5471), enter:
      <br/>
      <div class="styLNDesc" style="width:35mm;">
              Name of foreign entity
              <img src="{$ImagePath}/8275_Bullet.gif" alt="Bullet Image"/>
      </div>
    <div class="styUnderlineAmount" style="width:152mm;text-align:left">
     <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$Form8275Data/ForeignEntityName/BusinessNameLine1Txt"/>
     </xsl:call-template><br/>
     <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$Form8275Data/ForeignEntityName/BusinessNameLine2Txt"/>
     </xsl:call-template>
    </div>
  </div>
     <div style="width:187mm;">
      <div class="styLNDesc" style="width:55mm;">
              Employer identification number, if any
              <img src="{$ImagePath}/8275_Bullet.gif" alt="Bullet Image"/>
						</div>
						<div class="styUnderlineAmount" style="width:132mm;text-align:left">
						<xsl:choose>
						<xsl:when test="$Form8275Data/ForeignEntityEIN">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8275Data/ForeignEntityEIN"/>
							</xsl:call-template>
							</xsl:when>
							 <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8275Data/EINMissingReasonCd"/>
                </xsl:call-template>
              </xsl:otherwise>
               </xsl:choose>
						</div>
					</div>
		<div class="styBB" style="width:187mm;">
			<div class="styLNDesc" style="width:58mm;">
              Reference ID number (see instructions)
              <img src="{$ImagePath}/8275_Bullet.gif" alt="Bullet Image"/>
			</div>
			<div class="styLNDesc" style="width:129mm;text-align:left">
				<xsl:choose>
					<xsl:when test="count($Form8275Data/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1">
				See Additional Data Table
					</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8275Data/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
							</xsl:call-template>
						</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
		<!-- ****************************************************************************** -->
        <!-- Begin Part I -->
        <div style="width:187mm;height:7mm;" class="styBB">
						<!-- changed height from 5mm -->
          <div class="styGenericDiv" style="width:187mm;height:6mm">
            <div class="styPartName" style="width:15mm;margin-top:1.5mm;">Part I</div>
            <div class="styPartDesc" style="padding-left:3mm;margin-top:1.5mm;width:100mm;">
              General Information <span class="styNormalText">(see instructions)</span>
            </div>
            <div style="float:right;margin-top:2.8mm">
                <xsl:call-template name="SetDynamicTableToggleButton">
                  <xsl:with-param name="TargetNode" select="$Form8275Data/DisclosureGeneralInformation"/>
                <xsl:with-param name="containerHeight" select="6"/>
                <xsl:with-param name="headerHeight" select="1"/>
                  <xsl:with-param name="containerID" select=" 'TPctn' "/>
                </xsl:call-template>  
            </div>
          </div>
        </div>
        <!-- Gen information table -->
        <div class="styTableContainer" id="TPctn" style="height:auto;display:block">
          <xsl:call-template name="SetInitialState"/>
          <table class="styTable" cellspacing="0" name="TYTable" id="TYTable">
            <thead class="styTableThead">
              <tr style="height:6mm;">
                <th class="styTableCellHeader" style="width:45mm;border-color:black;border-color:black;" scope="col">
                  (a)<br/>Rev. Rul., Rev. Proc., etc.    
                </th>
                <th class="styTableCellHeader" style="width:23mm;border-color:black;" scope="col">
                  (b)<br/>Item or Group of Items
                </th>
                <th class="styTableCellHeader" style="width:58mm;border-right-width:0px;border-color:black;" scope="col">
                  (c)<br/>Detailed Description<br/> of Items
                </th>
                <th class="styTableCellHeader" style="width:23mm;border-left-width:1px;border-color:black;" scope="col">
                  (d)<br/>Form or <br/>Schedule
                </th>
                <th class="styTableCellHeader" style="width:13mm;border-color:black;text-align:center;" scope="col">
                  (e)<br/>Line <br/>No.
                </th>
                <th class="styTableCellHeader" style="width:24mm;border-color:black;border-right-width:0px;" scope="col">
                  (f)<br/>Amount
                </th>
              </tr>
            </thead>
            <tfoot/>
            <tbody>
              <xsl:choose>
                <xsl:when test="$Form8275Data/DisclosureGeneralInformation">
                  <xsl:if test="($Print != $Separated) or (count($Form8275Data/DisclosureGeneralInformation) &lt;=6) "> 
                  <xsl:for-each select="$Form8275Data/DisclosureGeneralInformation">
                    <tr style="height:12mm;">
                      <td class="styTableCell" style="width:45mm;vertical-align:top;text-align:left;border-color:black;">
                        <xsl:if test="position() = last() and position() &gt;= 6">
                          <xsl:attribute name="style">width:45mm;vertical-align:top;text-align:left;border-color:black;border-bottom-width:0px;</xsl:attribute>
                        </xsl:if>
                        <xsl:choose>
                          <xsl:when test="position() &lt;99 ">
                            <span style="width:3mm;font-weight:bold;"><xsl:value-of select="position()"/></span>
                          </xsl:when>
                          <xsl:otherwise>
                            <span style="width:3mm;"/>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CitationNm"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:23mm;text-align:left;border-color:black;vertical-align:top;">
                        <xsl:if test="position()=last() and position() &gt;= 6">
                          <xsl:attribute name="style">width:23mm;text-align:left;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DisclosureItemNm"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:58mm;border-style:solid;border-right-width:0px;text-align:left;border-color:black;vertical-align:top;">
                        <xsl:if test="position()=last() and position() &gt;= 6">
                          <xsl:attribute name="style">width:58mm;border-right-width:0px;text-align:left;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DetailedItemDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:23mm;border-left-width:1px;text-align:left;border-color:black;vertical-align:top;">
                        <xsl:if test="position()=last() and position() &gt;= 6">
                          <xsl:attribute name="style">width:23mm;border-left-width:1px;text-align:left;border-color:black;vertical-align:top;border-bottom-width:0px; 
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ScheduleOrFormNum"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:13mm;text-align:left;border-color:black;vertical-align:top;">
                        <xsl:if test="position()=last() and position() &gt;= 6">
                          <xsl:attribute name="style">width:13mm;text-align:left;border-color:black;vertical-align:top;border-bottom-width:0px;</xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="LineNum"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="width:24mm;text-align:right;border-color:black;border-right-width:0px;vertical-align:top;">
                        <xsl:if test="position()=last() and position() &gt;= 6">
                          <xsl:attribute name="style">width:24mm;text-align:right;border-color:black;border-right-width:0px;vertical-align:top;border-bottom-width:0px;
                          </xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="DisclosedItemAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                  </xsl:if>
                  <xsl:if test="count($Form8275Data/DisclosureGeneralInformation) &lt; 1 or ((count($Form8275Data/DisclosureGeneralInformation) &gt; 6) and ($Print = $Separated))">
                    <xsl:call-template name="populateirs8275partiemptycells">
                      <xsl:with-param name="index">1</xsl:with-param>
                      <xsl:with-param name="IsSeparated">true</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="count($Form8275Data/DisclosureGeneralInformation) &lt; 2 or ((count($Form8275Data/DisclosureGeneralInformation) &gt; 6) and ($Print = $Separated))">
                    <xsl:call-template name="populateirs8275partiemptycells">
                      <xsl:with-param name="index">2</xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="count($Form8275Data/DisclosureGeneralInformation) &lt; 3 or ((count($Form8275Data/DisclosureGeneralInformation) &gt; 6) and ($Print = $Separated))">
                    <xsl:call-template name="populateirs8275partiemptycells">
                      <xsl:with-param name="index">3</xsl:with-param>
                      </xsl:call-template>
                  </xsl:if>

                  <xsl:if test="count($Form8275Data/DisclosureGeneralInformation) &lt; 4 or 
                  ((count($Form8275Data/DisclosureGeneralInformation) &gt; 6) and ($Print = $Separated))">
                    <xsl:call-template name="populateirs8275partiemptycells">
                      <xsl:with-param name="index">4</xsl:with-param>
                      </xsl:call-template>
                  </xsl:if>
                   <xsl:if test="count($Form8275Data/DisclosureGeneralInformation) &lt; 5 or 
                   ((count($Form8275Data/DisclosureGeneralInformation) &gt; 6) and ($Print = $Separated))">
                    <xsl:call-template name="populateirs8275partiemptycells">
                      <xsl:with-param name="index">5</xsl:with-param>
                      </xsl:call-template>
                  </xsl:if>
                   <xsl:if test="count($Form8275Data/DisclosureGeneralInformation) &lt; 6 or 
                   ((count($Form8275Data/DisclosureGeneralInformation) &gt; 6) and ($Print = $Separated))">
                    <xsl:call-template name="populateirs8275partiemptycells">
                      <xsl:with-param name="index">6</xsl:with-param>
                      </xsl:call-template>
                  </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="populateirs8275partiemptycells">
                    <xsl:with-param name="index">1</xsl:with-param>
                  </xsl:call-template>
                  <xsl:call-template name="populateirs8275partiemptycells">
                    <xsl:with-param name="index">2</xsl:with-param>
                  </xsl:call-template>
                  <xsl:call-template name="populateirs8275partiemptycells">
                    <xsl:with-param name="index">3</xsl:with-param>
                    <xsl:with-param name="end">true</xsl:with-param>
                  </xsl:call-template>
                   <xsl:call-template name="populateirs8275partiemptycells">
                    <xsl:with-param name="index">4</xsl:with-param>
                    <xsl:with-param name="end">true</xsl:with-param>
                  </xsl:call-template>
                   <xsl:call-template name="populateirs8275partiemptycells">
                    <xsl:with-param name="index">5</xsl:with-param>
                    <xsl:with-param name="end">true</xsl:with-param>
                  </xsl:call-template>
                   <xsl:call-template name="populateirs8275partiemptycells">
                    <xsl:with-param name="index">6</xsl:with-param>
                    <xsl:with-param name="end">true</xsl:with-param>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </tbody>
          </table>
        </div>
        <xsl:if test="$Print != $Separated">
         <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$Form8275Data/DisclosureGeneralInformation"/>
            <xsl:with-param name="containerHeight" select="6"/>
            <xsl:with-param name="headerHeight" select="1"/>
            <xsl:with-param name="containerID" select=" 'TPctn' "/>
          </xsl:call-template> 
        </xsl:if>
          <!--********************************************************--> 
           <!-- Begin Part II -->
        <div style="width:187mm;height:7mm;" class="styBB">
          <div class="styPartName" style="width:15mm;margin-top:1.5mm;">Part II</div>
          <div class="styPartDesc" style="padding-left:3mm;margin-top:1.5mm;width:100mm;">
            Detailed Explanation <span class="styNormalText">(see instructions)</span>
          </div>
          <div style="float:right;margin-top:2.8mm">
            <xsl:call-template name="SetDynamicTableToggleButton">
              <xsl:with-param name="TargetNode" select="$Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc"/>
            <xsl:with-param name="containerHeight" select="6"/>
            <xsl:with-param name="headerHeight" select="0"/>
              <xsl:with-param name="containerID" select=" 'DEctn' "/>
            </xsl:call-template>  
        </div>
      </div>
        <!--Begin detailed explanation table -->
        <xsl:choose>
          <xsl:when test="$Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc">
            <div class="styTableContainer" id="DEctn" style="height:auto;display:block">
              <xsl:call-template name="SetInitialState"/>
              <table class="styTable" cellspacing="0" name="TYTable" id="TYTable" style="font-size:7pt;">
                <thead class="styTableThead">
                </thead>
                <tfoot/>
                <tbody>
                    <xsl:if test="($Print != $Separated) or (count($Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc) &lt;=6) "> 
                      <xsl:for-each select="$Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc">
                        <tr style="height:12mm;">
                          <td class="styTableCell" 
                          style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
                            <xsl:if test="position()=last() and position() &gt;= 6">
                              <xsl:attribute name="style">
                              width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;
                              vertical-align:top;border-bottom-width:0px;</xsl:attribute>
                            </xsl:if>
                            <xsl:if test="position() &lt;99 ">
                              <xsl:value-of select="position()"/>
                            </xsl:if>
                            <span class="styTableCellPad"/>
                          </td>
                          <td class="styTableCell" 
                          style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;">
                            <xsl:if test="position()=last() and position() &gt;= 6">
                              <xsl:attribute name="style">
                              text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;
                              vertical-align:top;border-bottom-width:0px;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="current()"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                        </tr>
                      </xsl:for-each>
                    </xsl:if>
					  <!-- added 20150903 -->
				<!--<xsl:if test="$Print != $Separated">-->
					<xsl:call-template name="SetInitialDynamicTableHeight">
						  <xsl:with-param name="TargetNode" select="$Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc"/>
						  <xsl:with-param name="containerHeight" select="6"/>
						  <xsl:with-param name="headerHeight" select="0"/>
						  <xsl:with-param name="containerID" select=" 'DEctn' "/>
					</xsl:call-template>
				<!--</xsl:if>-->
					  <!-- added 20150903 -->
          <!-- #######separated mode#######################-->
                  <xsl:if test="count($Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc) &lt; 1 or 
                  ((count($Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc) &gt; 3) and ($Print = $Separated))">
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;
                      border- color:black;vertical-align:top;border-color:black;">
                        1
                      </td>
                      <td class="styTableCell" 
                      style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                            <xsl:call-template name="PopulateAdditionalDataTableMessage">
                              <xsl:with-param name="TargetNode" select="$Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc"/>                      
                            </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" 
                      style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border- color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" 
                      style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" 
                      style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical- align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" 
                      style="text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc) &lt; 2 or 
                  ((count($Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc) &gt; 3) and ($Print = $Separated))">
                    <tr style="height:5mm;">
                      <td class="styTableCell" 
                      style="width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        2<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:if>
                  <xsl:if test="count($Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc) &lt; 3 or 
                  ((count($Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc) &gt; 3) and ($Print = $Separated))">
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        3<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                       4<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        5<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        6<span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                    <tr style="height:5mm;">
                      <td class="styTableCell" style="
                      width:3mm;font-weight:bold;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="
                      text-align:left;width:184mm;text-align:left;border-right-width:0px;border-left-width:0px;border-color:black;vertical-align:top;border-color:black;">
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                </xsl:if>
                </tbody>            
              </table>
            </div>
          </xsl:when>
          <xsl:otherwise>
            <div style="width:187mm;height:21mm;font-size:7pt;" class="styBB">
              <div style="width:187mm;height:7mm;" class="styBB">
                <div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;">1</div>
                <div class="styGenericDiv" style="width:184mm;"/>
              </div>
              <div style="width:187mm;height:7mm;" class="styBB">
                <div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
                <div class="styGenericDiv" style="width:184mm;"/>
              </div>
              <div style="width:187mm;height:7mm;" class="styGenericDiv">
                <div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
                <div class="styGenericDiv" style="width:184mm;"/>
              </div>
            </div>
            <div style="width:187mm;height:21mm;" class="styBB">
              <div style="width:187mm;height:7mm;" class="styBB">
                <div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;">2</div>
                <div class="styGenericDiv" style="width:184mm;"/>
              </div>
              <div style="width:187mm;height:7mm;" class="styBB">
                <div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
                <div class="styGenericDiv" style="width:184mm;"/>
              </div>
              <div style="width:187mm;height:7mm;" class="styGenericDiv">
                <div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
                <div class="styGenericDiv" style="width:184mm;"/>
              </div>
            </div>
            <div style="width:187mm;height:21mm;" class="styBB">
              <div style="width:187mm;height:7mm;" class="styBB">
                <div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;">3</div>
                <div class="styGenericDiv" style="width:184mm;"/>
              </div>
              <div style="width:187mm;height:7mm;" class="styBB">
                <div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
                <div class="styGenericDiv" style="width:184mm;"/>
              </div>
              <div style="width:187mm;height:7mm;" class="styGenericDiv">
              <div class="styLNLeftNumBox" style="padding-top:1mm;width:3mm;"/>
              <div class="styGenericDiv" style="width:184mm;"/>
            </div>
          </div>
        </xsl:otherwise>
      </xsl:choose>
      <!-- Begin Part III -->
      <div style="width:187mm;float:none;height:7mm" class="styBB">
      <!-- added height 7mm -->
        <div class="styPartName" style="width:15mm;">Part III</div>
        <div class="styPartDesc" style="padding-left:3mm;">
          Information About Pass-Through Entity. <span class="styNormalText">To be completed by partners, shareholders, beneficiaries, or
          residual interest holders.</span>
        </div>
      </div>
      <div style="width:187mm;float:none" class="styBB">
        <div style="width:186mm;height:4mm;font-weight:bold;" class="styGenericDiv">
          Complete this part only if you are making adequate disclosure for a pass-through item.
        </div>
        <div style="width:187mm;height:7mm;" class="styGenericDiv">
          <span style="height:3mm;width:174mm;">
            <b>Note:</b> <i>A pass-through entity is a partnership, S corporation, estate, trust, regulated investment company (RIC), real estate 
            investment</i>
          </span>
          <span style="height:3mm;width:91mm;text-align:right">
           <i>trust (REIT), or real estate mortgage investment conduit (REMIC).</i>
           </span>
        </div>
      </div>
      <div class="styBB" style="width:187mm;float:none;">
        <div class="styIRS8275LeftLine" style="width:113mm;height:27mm;">
          <div class="styLNLeftNumBox" style="width:4mm;padding-top:0mm;">1</div>
          <div class="styGenericDiv" style="width:108mm">
            Name, address, and ZIP code of pass-through entity <br/>
            <xsl:if test="$Form8275Data/PassThroughEntityBusName/BusinessNameLine1Txt">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form8275Data/PassThroughEntityBusName/BusinessNameLine1Txt"/>
            </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form8275Data/PassThroughEntityBusName/BusinessNameLine2Txt"><br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8275Data/PassThroughEntityBusName/BusinessNameLine2Txt"/>
              </xsl:call-template>
            </xsl:if>
            <br/>
            <xsl:if test="$Form8275Data/PassThroughEntityIndivNm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8275Data/PassThroughEntityIndivNm"/>
              </xsl:call-template>
            </xsl:if>
            <br/>
            <xsl:choose>
		<xsl:when test="$Form8275Data/PassThroughEntityUSAddress">							
            <xsl:call-template name="PopulateUSAddressTemplate">
              <xsl:with-param name="TargetNode" select="$Form8275Data/PassThroughEntityUSAddress"/>
            </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
             <xsl:call-template name="PopulateForeignAddressTemplate">
              <xsl:with-param name="TargetNode" select="$Form8275Data/PassThroughEntityFrgnAddress"/>
            </xsl:call-template>
            </xsl:otherwise>
         </xsl:choose>
          </div>
        </div>
        <div class="styIRS8275LeftLine" style="width:74mm;height:27mm;border-right-width:0px;">
          <div style="width:74mm;height:8mm;" class="styBB">
            <div class="styLNLeftNumBox" style="padding-top:0mm;width:4mm;text-align:center;">2</div>
            Identifying number of pass-through entity <br/>
            <xsl:choose>
              <xsl:when test="$Form8275Data/PassThroughEntitySSN">
			   <span style="width:25mm;padding-top:1mm">
                <xsl:call-template name="PopulateSSN">
                  <xsl:with-param name="TargetNode" select="$Form8275Data/PassThroughEntitySSN"/>
                </xsl:call-template>
               </span>
              </xsl:when>
              <xsl:when test="$Form8275Data/PassThroughEntityEIN">
			   <span style="width:25mm;padding-top:1mm">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$Form8275Data/PassThroughEntityEIN"/>
                </xsl:call-template>
                </span>
                </xsl:when>
                <xsl:otherwise>
			   <span style="width:25mm;padding-top:1mm">
				<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8275Data/MissingEINReasonCd"/>
                </xsl:call-template>
                </span>
              </xsl:otherwise>
            </xsl:choose>
          </div>
          <div style="width:74mm;height:8mm;" class="styBB">
            <div class="styLNLeftNumBox" style="padding-top:0mm;width:4mm;text-align:center;">3</div>
            Tax year of pass-through entity<br/>
            <span style="width:20mm;padding-top:1mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8275Data/PassThroughEntityTaxYearFromDt"/>
              </xsl:call-template>
            </span>
            <span style="width:20px;"/>to<span style="width:20px;"/>
            <span style="width:20mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8275Data/PassThroughEntityTaxYearToDt"/>
              </xsl:call-template>
            </span>
          </div>
          <div style="width:74mm;height:11mm;float:left;clear:none">
            <div class="styLNLeftNumBox" style="padding-top:0mm;width:4mm;text-align:center;">4</div>
            Internal Revenue Service Center where the
            pass-through entity filed its return         
            <span style="width:3px;"/>
        
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form8275Data/ServiceCenterWhereRetFiledCd"/>
      </xsl:call-template>  
      <span style="width:1mm;"/>
        <xsl:call-template name="LinkToLeftoverDataTableInline">
          <xsl:with-param name="Desc">Line 4 - E-File Indicator</xsl:with-param>
          <xsl:with-param name="TargetNode" select="$Form8275Data/ServiceCenterWhereRetFiledCd/@efileCd"/>
        </xsl:call-template>

            
            <br/>
              <div class="styLNLeftNumBox" style="padding-top:0mm;width:4mm;text-align:center;"/>
            <span style="width:30mm;height:3mm;padding-top:1mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8275Data/ServiceCenterWhereRetFiledCd"/>
              </xsl:call-template>
            </span>
          </div>
        </div>
      </div>
      <!-- Footer -->
      <div style="width:187mm;clear:both;padding-top:1mm;">
        <div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see separate instructions.</div>
        <div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 61935M</div>
        <div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">8275</span> (Rev. 8-2013)</div>
      </div>
   
  <!--<p class="pageend" style="border:0 solid green;"/>-->
  
      <!-- Begininning of write-in data -->
      <p style="page-break-before:always"/>
      <div class="styLeftOverTitleLine" id="LeftoverData">
        <div class="styLeftOverTitle">
          Additional Data        
        </div>
        <div class="styLeftOverButtonContainer">
          <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
        </div>      
      </div>
      <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$Form8275Data"/>
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
         <xsl:call-template name="PopulateLeftoverRowAmount">
			<xsl:with-param name="Desc">Form 8275, Part III, line 4 - E-File Indicator</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form8275Data/ServiceCenterWhereRetFiledCd/@efileCd"/>
			<xsl:with-param name="DescWidth" select="100"/>
		 </xsl:call-template>
      </table>
      <!-- ********************************************** -->
      <br/>
			<xsl:if test="count($Form8275Data/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum)  &gt; 1">
				<!--BEGIN Reference ID number -->
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:179mm;font-size:8pt;text-align:left;">
										Reference ID number
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$Form8275Data/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
											<xsl:otherwise>styDepTblRow2</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<td class="styTableCellText" style="width:179mm;">
										<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<!-- END Reference ID number  -->
				</xsl:if>
				<br/>
      <!-- ********************************************** -->
        
      <!-- Begin separated repeating data table -->
    <xsl:if test="($Print = $Separated) and (count($Form8275Data/DisclosureGeneralInformation) &gt; 3)">
      <span class="styRepeatingDataTitle">Form 8275, Part I -  General Information:</span>
        <table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
        <thead class="styTableThead">
          <tr class="styDepTblHdr">
                <th class="styDepTblCell" style="width:42mm;border-color:black;border-color:black;" scope="col">
                  (a)<br/>Rev. Rul., Rev. Proc., etc.    
                </th>
                <th class="styDepTblCell" style="width:23mm;border-color:black;" scope="col">
                  (b)<br/>Item or Group of Items
                </th>
                <th class="styDepTblCell" style="width:53mm;border-right-width:0px;border-color:black;" scope="col">
                  (c)<br/>Detailed Description<br/> of Items
                </th>
                <th class="styDepTblCell" style="width:23mm;border-left-width:1px;border-color:black;" scope="col">
                  (d)<br/>Form or <br/>Schedule
                </th>
                <th class="styDepTblCell" style="width:13mm;border-color:black;text-align:center;" scope="col">
                  (e)<br/>Line <br/>No.
                </th>
                <th class="styDepTblCell" style="width:30mm;border-color:black;border-right-width:0px;" scope="col">
                  (f)<br/>Amount
                </th>
              </tr>
            </thead>
            <tfoot/>
            <tbody>
                  <xsl:for-each select="$Form8275Data/DisclosureGeneralInformation">
                    <tr style="height:12mm;">
                      <xsl:attribute name="class">
                        <xsl:choose>
                           <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                           <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>
                      <td class="styDepTblCell" style="width:42mm;vertical-align:top;text-align:left;">
                            <span style="width:5mm;font-weight:bold;"><xsl:number value="position()" format="1"/></span>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="CitationNm"/>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DisclosureItemNm"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="width:53mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DetailedItemDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="width:23mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ScheduleOrFormNum"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="width:13mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="LineNum"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell" style="width:30mm;text-align:right;vertical-align:top;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="DisclosedItemAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
            </tbody>
          </table>
          <br/>
      </xsl:if>
  
          <!-- Repeating data Begin Table Part III Detail explanation -->
    <xsl:if test="($Print = $Separated) and (count($Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc) &gt; 3)">
      <span class="styRepeatingDataTitle">Form 8275, Part II -  Detailed Explanation:</span>
          <table class="styDepTbl" cellspacing="0" name="TYTable" id="TYTable" style="font-size:7pt;">
              <thead class="styTableThead">
                </thead>
                <tfoot/>
                <tbody>
                      <xsl:for-each select="$Form8275Data/DisclosureGeneralInformation/DetailedExplanationDesc">
                        <tr style="height:12mm;">
                          <xsl:attribute name="class">
                            <xsl:choose>
                               <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                               <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                            </xsl:choose>
                          </xsl:attribute>
                          <td class="styDepTblCell" style="width:5mm;font-weight:bold;text-align:left;vertical-align:top;border-right-width:0px;padding-right:0px;">
                              <xsl:number value="position()" format="1"/>
                            <span class="styTableCellPad"/>
                          </td>
                          <td class="styDepTblCell" style="text-align:left;width:182mm;text-align:left;vertical-align:top;border-left-width:0px;padding-left:0.5px;">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="current()"/>
                            </xsl:call-template>
                            <span class="styTableCellPad"/>
                          </td>
                        </tr>
                      </xsl:for-each>
                </tbody>            
              </table>
          </xsl:if>
        <!-- End Separated Repeating Data table -->
      </form>
  </body>
</html>
</xsl:template>
<xsl:template name="populateirs8275partiemptycells">
  <xsl:param name="index"/>
  <xsl:param name="end">false</xsl:param>
  <xsl:param name="IsSeparated">false</xsl:param>
  <tr style="height:12mm;">
    <xsl:if test="($end = 'false')">
      <td class="styTableCell" style="width:45mm;vertical-align:top;text-align:left;border-color:black;">
        <span class="styLNLeftNumBox" style="padding-left:0mm;text-align:left;width:3mm;"><xsl:value-of select="$index"/></span>
        <xsl:if test="$IsSeparated != 'false' ">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$Form8275Data/DisclosureGeneralInformation"/>                      
              </xsl:call-template>
        </xsl:if>
      </td>
      <td class="styTableCell" style="width:23mm;text-align:left;border-color:black;">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="width:60mm;border-style:solid;border-right-width:0px;text-align:left;vertical-align:top;border-color:black;">
        <span class="styTableCellPad"/><!--
        <span class="styBB" style="border-style:solid;width:59mm;padding-top:3mm;"/>-->
      </td>
      <td class="styTableCell" style="width:23mm;border-left-width:1px;text-align:left;border-color:black;">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="width:13mm;text-align:left;border-color:black;">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="width:24mm;border-color:black;border-right-width:0px;">
        <span class="styTableCellPad"/>
      </td>
    </xsl:if>
    <xsl:if test="($end != 'false')">
      <td class="styTableCell" style="width:45mm;vertical-align:top;text-align:left;border-color:black;border-bottom-width:0px;">
        <span class="styLNLeftNumBox" style="padding-left:0mm;text-align:left;"><xsl:value-of select="$index"/></span>
      </td>
      <td class="styTableCell" style="width:23mm;text-align:left;border-color:black;border-bottom-width:0px;">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="width:58mm;border-style:solid;border-right-width:0px;text-align:left;vertical-align:top;border-color:black;border-bottom-width:0px;">
        <span class="styBB" style="border-style:solid;width:57mm;padding-top:3mm;"/>
      </td>
      <td class="styTableCell" style="width:23mm;border-left-width:1px;text-align:left;border-color:black;border-bottom-width:0px;">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="width:13mm;text-align:left;border-color:black;border-bottom-width:0px;">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="width:24mm;border-color:black;border-right-width:0px;border-bottom-width:0px;">
        <span class="styTableCellPad"/>
      </td>
    </xsl:if>
  </tr>
</xsl:template>
</xsl:stylesheet>