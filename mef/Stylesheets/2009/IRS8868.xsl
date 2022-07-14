<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8868Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="IRS8868Data" select="$RtnDoc/IRS8868"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($IRS8868Data)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8868"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<!-- This is a test of the streams -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 8868 CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS8868Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8868">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeader"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="styBB" style="width:187mm; height:22mm;">
						<div class="styFNBox" style="width:31mm;height:22mm; border-right-width: 2px">
							<div style="padding-top:1mm;">
      Form<span class="styFormNumber">&#160;&#160;8868</span>(Rev. April 2009)    </div>
							<div style="padding-top:2mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:22mm">
							<div class="styMainTitle" style="height:8mm;">Application for Extension of Time To File an<br/>Exempt Organization Return</div>
							<div class="styFBT" style="height:5mm; font-size: 7pt; font-weight: normal;padding-top: 2mm">
								<img src="{$ImagePath}/8868_Bullet_Title.gif" alt="bullet"/> File a separate application for each return.<span style="width: 5mm"/>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:22mm; border-left-width: 2px; padding-top: 10mm; font-size: 7pt">OMB No. 1545-1709
  </div>
					</div>
					<!--   END FORM HEADER   -->
					<div style="width: 187mm">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/>
						<label for="3MonthExtension"> If you are filing for an <b>Automatic 3-Month Extension, complete only Part I </b> and check this box</label>
						<b>
							<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.
  <span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.
  <span class="styIRS8868NBSP"/>.
  </b>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<input type="checkbox" class="styIRS8868Ckbox" name="3MonthExtension" TabIndex="-1" id="3MonthExtension" onclick="return false;"/>
					</div>
					<div style="width: 187mm">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> If you are filing for an <b>Additional (not automatic) 3-Month Extension, complete only Part II</b> (on page 2 of this form).
</div>
					<div class="styIRS8868NoteHdr" style="border-top-width: 0px; font-style:normal;border-bottom-width: 0px;">
						<span class="styItalicText">Do not complete Part II unless </span>
						<span style="font-weight:normal">you have already been granted an automatic 3-month extension on a previously filed Form 8868.</span>
					</div>
					<!--   BEGIN PART I   -->
					<!--   BEGIN PART I HEADER   -->
					<div class="styIRS8868PartHdr" style="border-bottom-width: 0px">
						<span class="styPartName">Part I</span>
						<span class="styPartDesc">Automatic 3-Month Extension of Time.<span style="font-weight: normal">  Only submit original (no copies needed).</span>
						</span>
					</div>
					<div style="width:187mm;"/>
					<div class="styIRS8868NoteHdr" style="border-bottom-width: 0px">
						<span>
							<label for="6MonthExtension">
								<span style="font-style:normal; font-weight: normal">A corporation required to file Form 990-T and requesting an automatic 6-month extension&#151;check this box and complete<br/> Part I only</span>
							</label>
						</span>
						<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span style="width: 11px"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<input type="checkbox" class="styIRS8868Ckbox" name="6MonthExtension" TabIndex="-1" id="6MonthExtension" onclick="return false;"/>
					</div>
					<span class="styBB" style="font-style: italic; font-weight:normal; width: 187mm;padding-top:1mm;height:18mm;">All other corporations (including 1120-C filers), partnerships, REMICs, and trusts must use Form 7004 to request an extension of time to file income tax returns.<br/>
						<span style="font-style:normal;padding-top:1mm;height:12mm;">
							<b>Electronic Filing (e-file).</b> Generally, you can electronically file Form 8868 if you want a 3-month automatic extension of time to file
one of the returns noted below (6 months for a corporation required to file Form 990-T). However, you cannot file
Form 8868 electronically if (1) you want the additional (not automatic) 3-month extension or (2) you file Forms 990-BL, 6069, or
8870, group returns, or a composite or consolidated Form 990-T. Instead, you must submit the fully completed and signed page
2 (Part II) of Form 8868. For more details on the electronic filing of this form, visit <i>www.irs.gov/efile</i> and click on <i>e-file for Charities and Nonprofits.</i>
						</span>
					</span>
					<!--   END PART I HEADER   -->
					<div style="width:187mm;float:left;clear:none;">
						<div class="styUseLbl" style="width:18mm;height:33mm; font-size: 7pt; border-top-width: 0px">
							<b>Type or print</b>
							<br/>
							<span style="font-size: 6pt; font-weight: normal">File by the due date for filing your return. See instructions.</span>
						</div>
						<div class="styNameAddr" style=" border-bottom-width: 0px; border-top-width: 0px; border-right-width: 1px;width:110mm;height:8mm;font-size: 7pt">
      Name of Exempt Organization<br/>
							<span style="font-family:verdana;font-size:6pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="padding-left:2mm;font-weight:bold;font-size:7pt;">Employer identification number<br/>
							<br/>
							<span style="text-align:left;font-size: 7pt; font-weight:normal;">
								<!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter when calling PopulateReturnHeaderFiler.-->
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="styNameAddr" style="width:169mm;height:10mm; font-size:7pt; border-top-width: 1px">
      Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styNameAddr" style="border-bottom-width: 0px;width:169mm;height:8mm;font-size: 7pt">
      City, town or post office, state, and ZIP code. For a foreign address, see instructions.<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Country</xsl:with-param>
								<xsl:with-param name="MainForm">true</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div style="width: 187mm; border-style:solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px; font-size: 8pt">
						<b>Check type of return to be filed</b> (file a separate application for each return):</div>
					<!-- Begin Form 990  -->
					<div style="width: 187mm; font-size: 8pt">
						<span style="float: left; clear: none">
							<input type="checkbox" class="styIRS8868Ckbox" name="Form990" id="Form990">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form990"/>
								</xsl:call-template>
							</input>
						</span>
						<span class="styIRS8868CkboxText">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form990"/>
								</xsl:call-template>Form 990</label>
						</span>
						<!-- End Form 990  -->
						<!-- Begin Form 990T Corporation -->
						<span style="float:left; clear: none">
							<input type="checkbox" class="styIRS8868Ckbox" name="Form990T" id="Form990T">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form990TCorporation"/>
								</xsl:call-template>
							</input>
						</span>
						<span class="styIRS8868CkboxText" style="width:72mm">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form990T"/>
								</xsl:call-template>Form 990-T (corporation)</label>
						</span>
						<!--  End Form 990T  -->
						<!-- Begin Form 4720  -->
						<span style="float:left; clear: none">
							<input type="checkbox" class="styIRS8868Ckbox" name="Form4720" id="Form4720">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form4720"/>
								</xsl:call-template>
							</input>
						</span>
						<span class="styIRS8868CkboxText">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form4720"/>
								</xsl:call-template>Form 4720</label>
						</span>
					</div>
					<!-- End Form 4720  -->
					<div style="width: 187mm; font-size: 8pt">
						<!-- Begin Form 990BL  -->
						<span style="float: left; clear: none">
							<input type="checkbox" class="styIRS8868Ckbox" name="Form990BL" id="Form990BL" TabIndex="-1" onclick="return false;"/>
							<span class="styIRS8868CkboxText" style="width: 47.50mm; float: none; clear: none; padding-bottom: .75mm">
								<label for="Form990BL">Form 990-BL</label>
							</span>
							<span style="width: .25mm"/>
						</span>
						<!--xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$IRS8868Data/Form990BL" />
      </xsl:call-template>
    </input>
  </span>
  <span class="styIRS8868CkboxText"><label><xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$IRS8868Data/Form990BL" /></xsl:call-template>Form 990-BL</label></span-->
						<!-- End Form 990BL  -->
						<!-- Begin Form 990T (sec. 401(a) or 408(a)trust -->
						<span style="float:left; clear: none">
							<input type="checkbox" class="styIRS8868Ckbox" name="Form990TSection401a408Trust" id="Form990TSection401a408Trust">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form990TSection401a408aTrust"/>
								</xsl:call-template>
							</input>
						</span>
						<span class="styIRS8868CkboxText" style="width:72mm">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form990TSection401a408Trust"/>
								</xsl:call-template>Form 990-T (sec. 401(a) or 408(a) trust)</label>
						</span>
						<!-- End Form 990T (sec. 401(a) or 408(a)trust -->
						<!-- Begin Form 5227 -->
						<span style="float:left; clear: none">
							<input type="checkbox" class="styIRS8868Ckbox" name="Form5227" id="Form5227">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form5227"/>
								</xsl:call-template>
							</input>
						</span>
						<span class="styIRS8868CkboxText">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form5227"/>
								</xsl:call-template>Form 5227</label>
						</span>
					</div>
					<!-- End Form 5227 -->
					<!-- Begin Form 990EZ -->
					<div style="width: 187mm; font-size: 8pt">
						<span style="float: left; clear: none">
							<input type="checkbox" class="styIRS8868Ckbox" name="Form990EZ" id="Form990EZ">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form990EZ"/>
								</xsl:call-template>
							</input>
						</span>
						<span class="styIRS8868CkboxText">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form990EZ"/>
								</xsl:call-template>Form 990-EZ</label>
						</span>
						<!-- End Form 990EZ -->
						<!-- Begin Form 990TTrustOthThan401aOr408a -->
						<span style="float:left; clear: none">
							<input type="checkbox" class="styIRS8868Ckbox" name="Form990TTrustOthThan401aOr408a" id="Form990TTrustOthThan401aOr408a">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form990TTrustOthThan401aOr408a"/>
								</xsl:call-template>
							</input>
						</span>
						<span class="styIRS8868CkboxText" style="width:72mm">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form990TTrustOthThan401aOr408a"/>
								</xsl:call-template>Form 990-T (trust other than above)</label>
						</span>
						<!-- End Form 990TTrustOthThan401aOr408a -->
						<!-- Begin Form 6069 -->
						<span style="float:left; clear: none">
							<input type="checkbox" class="styIRS8868Ckbox" name="Form6069" id="Form6069" TabIndex="-1" onclick="return false;"/>
							<span class="styIRS8868CkboxText" style="width: 15mm; float: none; clear: none; padding-bottom: .75mm">
								<label for="Form6069"> Form 6069</label>
							</span>
							<span style="width: 1mm"/>
						</span>
						<!--xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$IRS8868Data/Form6069" />
      </xsl:call-template>
    </input>
  </span>
  <span class="styIRS8868CkboxText"><label><xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$IRS8868Data/Form6069" /></xsl:call-template>Form 6069</label></span-->
						<!-- End Form 6069 -->
					</div>
					<div style="width: 187mm; border-style: solid; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px">
						<!-- Begin Form 990PF -->
						<span style="float: left; clear: none">
							<input type="checkbox" class="styIRS8868Ckbox" name="Form990PF" id="Form990PF">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form990PF"/>
								</xsl:call-template>
							</input>
						</span>
						<span class="styIRS8868CkboxText">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form990PF"/>
								</xsl:call-template>Form 990-PF</label>
						</span>
						<!-- End Form 990PF-->
						<!-- Begin Form 1041A -->
						<span style="float:left; clear: none">
							<input type="checkbox" class="styIRS8868Ckbox" name="Form1041A" id="Form1041A">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form1041A"/>
								</xsl:call-template>
							</input>
						</span>
						<span class="styIRS8868CkboxText" style="width:72mm">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/Form1041A"/>
								</xsl:call-template>Form 1041-A</label>
						</span>
						<!-- End Form 1041A -->
						<!-- Begin Form 8870 -->
						<span style="float:left; clear: none">
							<input type="checkbox" class="styIRS8868Ckbox" name="Form8870" id="Form8870" TabIndex="-1" onclick="return false;"/>
							<span class="styIRS8868CkboxText" style="width: 15mm; float: none; clear: none; padding-bottom: .75mm">
								<label for="Form8870"> Form 8870</label>
							</span>
							<span style="width: 1mm"/>
						</span>
						<!--xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$IRS8868Data/Form8870" />
      </xsl:call-template>
    </input>
  </span>
  <span class="styIRS8868CkboxText"><label><xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$IRS8868Data/Form8870" /></xsl:call-template>Form 8870</label></span-->
						<!-- End Form 8870 -->
					</div>
					<!--Schema Mods for TY2004 -->
					<!--The books are in the care of - Person or Business Name-->
					<div style="width:187mm;"/>
					<div style="width: 187mm;">
						<div class="styGenericDiv">
							<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> The books are in the care of
      <span style="width:   2mm"/>
							<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
							<span style="width: 2mm"/>
						</div>
						<div class="styGenericDiv" style="width:140mm;border-bottom:1 solid black;">
							<div style="font-family:verdana;">
								<xsl:choose>
									<xsl:when test="$IRS8868Data/TheBooksAreInCareOf/NamePerson">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS8868Data/TheBooksAreInCareOf/NamePerson"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS8868Data/TheBooksAreInCareOf/NameBusiness/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:if test="$IRS8868Data/TheBooksAreInCareOf/NameBusiness/BusinessNameLine2 != '' ">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS8868Data/TheBooksAreInCareOf/NameBusiness/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<xsl:if test="$IRS8868Data/TheBooksAreInCareOf/AddressUS">
								<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/TheBooksAreInCareOf/AddressUS"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$IRS8868Data/TheBooksAreInCareOf/AddressForeign">
								<xsl:call-template name="PopulateForeignAddressTemplate">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/TheBooksAreInCareOf/AddressForeign"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--Telephone No. and Fax No. -->
					<div style="width:187mm;"/>
					<div style="width: 187mm;">
						<span style="width:3mm"/>Telephone No.<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<span class="styFixedUnderline" style="float:none;width:40mm">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/TheBooksAreInCareOf/TelephoneNumber"/>
							</xsl:call-template>
						</span>
						<span style="width:17mm"/>FAX No.<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<span class="styFixedUnderline" style="float:none;width:40mm">
							<xsl:call-template name="PopulatePhoneNumber">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/TheBooksAreInCareOf/FaxNumber"/>
							</xsl:call-template>
						</span>
					</div>
					<!--End schema mods -->
					<div style="width: 187mm">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/OrgDoesNotHaveAnOfficeInUS"/>
							</xsl:call-template> If the organization does not have an office or place of business in the United States, check this box</label>
						<b>
							<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.
  <span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.<span class="styIRS8868NBSP"/>.
  </b>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<input type="checkbox" class="styIRS8868Ckbox" name="OrgDoesNotHaveAnOfficeInUS" id="OrgDoesNotHaveAnOfficeInUS">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$IRS8868Data/OrgDoesNotHaveAnOfficeInUS"/>
							</xsl:call-template>
						</input>
					</div>
					<div style="width: 187mm">
						<img src="{$ImagePath}/8868_Bullet_Round.gif" alt="bullet"/> If this is for a Group Return, enter the organization's four digit Group Exemption Number (GEN)_____________.
    <label for="WholeGroup">If this is for the whole group, check this box</label>
						<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<input type="checkbox" class="styIRS8868Ckbox" name="WholeGroup" TabIndex="-1" id="WholeGroup" onclick="return false"/>. <label for="PartGroup"> If it is for part of the group, check this box</label>
						<span style="width: 2mm"/>
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<input type="checkbox" class="styIRS8868Ckbox" name="PartGroup" TabIndex="-1" id="PartGroup" onclick="return false"/> and attach a list with the names and EINs of all members the extension will cover.
</div>
					<!--   BEGIN LINE 1   -->
					<div class="styIRS8868LineItem" style="border-top-width: 1px">
						<span class="styIRS8868LNLeftNumBox" style="margin-right: 1mm">1</span>
						<span class="styIRS8868LNDesc" style="width: 180mm">I request an automatic 3-month (6 months for a  corporation required to file Form 990-T) extension of time until <span style="width: 18mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/ExtensionToDate"/>
								</xsl:call-template>
							</span>
    to file the exempt organization return for the organization named above.  The extension is for the organization's return for:
  </span>
					</div>
					<div class="styIRS8868LineItem" style="margin-left: 3mm">
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<xsl:choose>
							<xsl:when test="$RtnHdrData/TaxYear != '' ">
								<input type="checkbox" class="styIRS8868Ckbox" name="CalendarYearCheckBox" id="CalendarYearCheckBox" onclick="return false" checked="checked"/>
							</xsl:when>
							<xsl:otherwise>
								<input type="checkbox" class="styIRS8868Ckbox" name="CalendarYearCheckBox" TabIndex="-1" id="CalendarYearCheckBox" onclick="return false;"/>
							</xsl:otherwise>
						</xsl:choose>
						<span class="styIRS8868CkboxText" style="float: none; clear:none">
							<label for="CalendarYearCheckBox"> calendar year 
    <span style="width:8mm;border-style:solid;float:none;clear:none;padding-left: .5mm" class="styBB">
									<xsl:if test="$RtnHdrData/TaxYear != '' ">
										<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
									</xsl:if>
								</span> or</label>
						</span>
					</div>
					<div class="styIRS8868LineItem" style="margin-left: 3mm">
						<img src="{$ImagePath}/8868_Bullet_Lg.gif" alt="bullet"/>
						<span style="width: 2mm"/>
						<xsl:choose>
							<xsl:when test="substring($RtnHdrData/TaxPeriodEndDate,6,5) != '12-31'">
								<input type="checkbox" class="styIRS8868Ckbox" name="TaxYearCheckBox" id="TaxYearCheckBox" onclick="return false" checked="checked"/>
							</xsl:when>
							<xsl:otherwise>
								<input type="checkbox" class="styIRS8868Ckbox" name="TaxYearCheckBox" TabIndex="-1" id="TaxYearCheckBox" onclick="return false;"/>
							</xsl:otherwise>
						</xsl:choose>
						<span class="styIRS8868CkboxText" style="width: 160mm; float: none; clear: none">
							<label for="TaxYearCheckBox"> tax year beginning         
        <xsl:choose>
									<xsl:when test="substring($RtnHdrData/TaxPeriodEndDate,6,5) != '12-31'">
										<span style="padding-left: 1mm;width:20mm;border-style:solid;float:none;clear:none;" class="styBB">
											<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span style="width:20mm;border-style:solid;float:none;clear:none;" class="styBB"/>
										<span style="width:4px;"/>,<span style="width:4px;"/>
										<span style="width:8mm;border-style:solid;float:none;clear:none;padding-left: .5mm" class="styBB"/>
										<span style="width:4px;"/>,
          </xsl:otherwise>
								</xsl:choose>
							</label>
							<!-- Deleted in the 2003V02 schema
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$IRS8868Data/TaxYearBeginningDate" />
      </xsl:call-template>  -->
							<label for="TaxYearCheckBox"> and ending
        <xsl:choose>
									<xsl:when test="substring($RtnHdrData/TaxPeriodEndDate,6,5) != '12-31'">
										<span style="padding-left: 1mm;width:20mm;border-style:solid;float:none;clear:none;" class="styBB">
											<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
										</span>
									</xsl:when>
									<xsl:otherwise>
										<span style="width:20mm;border-style:solid;float:none;clear:none;" class="styBB"/>
										<span style="width:4px;"/>,<span style="width:4px;"/>
										<span style="width:8mm;border-style:solid; float:none;clear:none;padding-left: .5mm" class="styBB"/>
										<span style="width:4px;"/>,
          </xsl:otherwise>
								</xsl:choose>
							</label>
						</span>
						<!--  Deleted in the 2003V02 schema
    <xsl:call-template name="PopulateText">
      <xsl:with-param name="TargetNode" select="$IRS8868Data/TaxYearEndingDate" />
    </xsl:call-template>  -->
					</div>
					<!--   END LINE 1   -->
					<br/>
					<br/>
					<!--  BEGIN LINE 2  -->
					<div class="styIRS8868LineItem">
						<span class="styIRS8868LNLeftNumBox" style="margin-right: 1mm;padding-top:1mm;">2</span>
						<span class="styIRS8868LNDesc" style="width: 180mm">If this tax year is for less than 12 months, check reason: <span style="width: 1mm"/>
							<input type="checkbox" class="styIRS8868Ckbox" name="InitialReturn" TabIndex="-1" id="InitialReturn" onclick="return false;"/>
							<span class="styIRS8868CkboxText" style="width: 20mm; float: none; clear: none">
								<label for="InitialReturn"> Initial return</label>
							</span>
							<span style="width: 1mm"/>
							<input type="checkbox" class="styIRS8868Ckbox" name="FinalReturn" TabIndex="-1" id="FinalReturn" onclick="return false;"/>
							<span class="styIRS8868CkboxText" style="width: 20mm; float: none; clear: none">
								<label for="FinalReturn"> Final return</label>
							</span>
							<span style="width: 1mm"/>
							<input type="checkbox" class="styIRS8868Ckbox" name="ChangeAccountingPeriod" TabIndex="-1" id="ChangeAccountingPeriod" onclick="return false;"/>
							<span class="styIRS8868CkboxText" style="width:40mm; float: none; clear: none">
								<label for="ChangeAccountingPeriod"> Change in accounting period</label>
							</span>
						</span>
					</div>
					<!--  END LINE 2  -->
					<!--  BEGIN LINE 3a  -->
					<div class="styBB" style="width:187mm;border-top-width:1">
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">3a</div>
							<div class="styLNDesc" style="border: 0 solid black;border-bottom-width:1px;height:7.5mm;width:136mm">If this application is for Form 990-BL, 990-PF, 990-T, 4720, or 6069, enter the tentative tax, less any nonrefundable credits. See instructions.      <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="padding-top:3.75mm;height:7.5mm;">3a</div>
							<div class="styLNAmountBox" style="height:7.5mm; padding-top:3.75mm;width:34mm">
								<span class="styBoldText" style="padding-left:1mm;float:left;">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/TentativeTax"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 3a  -->
						<!--  BEGIN LINE 3b  -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span style="width:2mm"/>b</div>
							<div class="styLNDesc" style="border: 0 solid black;border-bottom-width:1px;height:7.5mm;width:136mm">If this application is for Form 990-PF or 990-T, enter any refundable credits and estimated tax payments made. Include any prior year overpayment allowed as a credit.      <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="padding-top:3.75mm;height:7.5mm;">3b</div>
							<div class="styLNAmountBox" style="height:7.5mm; padding-top:3.75mm;width:34mm">
								<span class="styBoldText" style="padding-left:1mm;float:left">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/RefundableCrEstimatedPayments"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 3b  -->
						<!--  BEGIN LINE 3c  -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span style="width:2mm"/>c</div>
							<div class="styLNDesc" style="border: 0 solid black;height:6mm;width:136mm">
								<b>Balance Due.</b> Subtract line 3b from line 3a. Include your payment with this form, or, if required, deposit with FTD coupon or, if required, by using EFTPS (Electronic Federal Tax Payment System). See instructions.      <span style="width:2px;"/>
								<!-- Form to Form Link -->
							</div>
							<div class="styLNRightNumBox" style="border-bottom-width:0; height:6mm;background-color:lightgrey"/>
							<div class="styLNAmountBox" style="height:6mm;border-bottom-width:0;width:34mm"/>
							<div class="styLNRightNumBox" style="border-bottom-width:0">3c</div>
							<div class="styLNAmountBox" style="border-bottom-width:0;width:34mm">
								<span class="styBoldText" style="padding-left:1mm;float:left">$</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS8868Data/BalanceDue"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styIRS8868LineItem" style="border-bottom-width: 1px">
						<b>Caution.</b> If you are going to make an electronic fund withdrawal with this Form 8868, see Form 8453-EO and Form 8879-EO
	for payment instructions.
</div>
					<!--  END LINE 3c  -->
					<!--  BEGIN SIGNATURE AND VERIFICATION  -->
					<div style="width: 187mm; text-align: center; font-weight: bold; font-size: 7pt">Signature and Verification</div>
					<div style="width: 187mm; text-align: left; font-size: 6pt">Under penalties of perjury, I declare that I have examined this form, including accompanying schedules and statements, and to the best of my knowledge and 
  belief, it is true, correct, and complete, and that I am authorized to prepare this form.
</div>
					<br/>
					<br/>
					<div class="styBB" style="width: 187mm; text-align: left; font-size: 7pt">
						<span style="width: 70mm">
							<span style="font-size:6pt;padding-right:1mm;">Signature</span>
							<img src="{$ImagePath}/8868_Bullet_Sm.gif" alt="bullet"/>
						</span>
						<span style="width: 70mm">
							<span style="font-size:6pt;padding-right:1mm;">Title</span>
							<img src="{$ImagePath}/8868_Bullet_Sm.gif" alt="bullet"/>
						</span>
						<span style="width: 27mm">
							<span style="font-size:6pt;padding-right:1mm;">Date</span>
							<img src="{$ImagePath}/8868_Bullet_Sm.gif" alt="bullet"/>
						</span>
					</div>
					<!--BEGIN FOOTER-->
					<div style="width:187mm">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see Instructions.</span>
						</div>
						<div style="float:right">
    Cat. No. 27916D 
    <span style="width:70px"/>
    Form<span class="styBoldText" style="font-size: 8pt"> 8868 </span>(Rev. 4-2009)
  </div>
					</div>
					<!--END FOOTER-->
					<br/>
					<div class="pageEnd"/>
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
							<xsl:with-param name="TargetNode" select="$IRS8868Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
