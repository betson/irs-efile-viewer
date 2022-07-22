<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 9/20/2014 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="IRS8931Style.xsl"/>
    <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
    <xsl:strip-space elements="*"/>
	<xsl:param name="Form8931Data" select="$RtnDoc/IRS8931"/>
        <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
            <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <title>
                    <xsl:call-template name="FormTitle">
                        <xsl:with-param name="RootElement" select="local-name($Form8931Data)"/>
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
                <meta name="Description" content="IRS Form 1065"/>
                <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
                <xsl:call-template name="InitJS"/>
                <style type="text/css">
                    <xsl:if test="not($Print) or $Print=''">
                        <xsl:call-template name="IRS8931Style"/>
                        <xsl:call-template name="AddOnStyle"/>
                    </xsl:if>
                </style>
                <xsl:call-template name="GlobalStylesForm"/>
            </head>
            <body class="styBodyClass">
                <form name="Form8931">
                    <xsl:call-template name="DocumentHeader"/>
                    <div class="styBB" style="width:187mm;">
                        <div class="styFNBox" style="height:19mm; width:37.5mm;">
                            <div>
                Form <span class="styFormNumber"> 8931</span>
                                <br/>(December 2010)<br/>
                                <div style="font-size:6pt; padding-top:1.8mm">
              Department of the Treasury<br/>Internal Revenue Service 
                                </div>
                            </div>
                        </div>
                        <div class="styFTBox" style="width:112mm">
                            <div class="styMainTitle" style="padding-top:3mm">Agricultural Chemicals Security Credit</div>
                           <br/> <div class="styFBT" style="margin-top:3mm;">
                                <img src="{$ImagePath}/8931_Bullet_Md.gif" alt="Arrow Bullet"/>See instructions.
                            </div>    
                          <br/>  <div class="styFBT" style="margin-top:1mm;"> 
                                <img src="{$ImagePath}/8931_Bullet_Md.gif" alt="Arrow Bullet"/>Attach to your tax return.
                            </div>
                        </div>
                        <div class="styTYBox" style="height:19mm;width:37.5mm;border-left-width:1px;">
<div class="styOMB" style="height:7mm;font-size:7pt;padding-top:1mm;">OMB No. 1545-2122</div>
<div style="margin-left:1mm;text-align:left;font-size:7pt;height:12mm;padding-top:4mm;">
Attachment<br/>Sequence No. 
<span class="styBoldText" style="font-size:9pt;">162</span>
</div>
</div>
</div>

                    
     <!-- Begin Names and Identifying number section -->

    <div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
      <div class="styNameBox" style="width:140mm;height:12mm;font-size:7pt;">
        Name shown on return<br/><br/>
             <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template><br/>
       </div>
      <div class="styEINBox" style="width:35mm;height:12mm;padding-left:2mm;font-size:7pt;font-weight:normal;">
        <b>Identifying number</b><br/>
        <span style="text-align:left;padding-top:2mm;">
          <xsl:call-template name="PopulateReturnHeaderFiler">
			  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
          </xsl:call-template>          
         <xsl:call-template name="PopulateReturnHeaderFiler">
			   <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
         </xsl:call-template> 
        </span>          
      </div>
    </div>
    
    <!-- End Names and Identifying number section -->
         
 <!-- Start Line 1 -->

        				<!--<xsl:if test="$Form8931Data/QlfyAgricChemicalsSecCostsGrp">-->
							<xsl:for-each select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp">
								<xsl:variable name="pos" select="position()"/>
								<xsl:if test="(position() mod 3)=1">
									<div class="styIRS8931TableContainer" style="display:block;"  id="QlfyAgricChemicalsSecCostsGrp">
										<xsl:call-template name="SetInitialState"/>
        <th style="width:187mm;">
            <div class="styLNDesc" style="width:101.2mm;height:auto;"></div>
            <div class="styLNDesc" style="width:85.5mm;height:auto;padding-left:40mm;border-style:solid;border-right-width:0px;
				border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;float:left;clear:none;">
						<b>Facility</b></div>
		</th>
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftNumBox" style="height:10mm;padding-top:2.5mm;">1
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:2.5mm;">
								Enter on the applicable line below the qualified agricultural<br/>
								chemicals security costs described (see instructions)
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;"></span>
                            </div>
                            <div class="styLNRightNumBox" style="height:10mm;width:6mm;padding-top:0mm;
								border-right-width:1px;background-color:lightgrey;">                            
                            </div>
                            <div class="styLNDesc"  style="height:10mm;width:26.5mm;padding-top:3mm;border-left-width:0px;
								text-align:center;border-style:solid; border-color:black;border-top-width:0px;border-bottom-width:1px; 
								border-left-width: 0px; border-right-width: 0px;">(<xsl:number value="($pos)" format="a"/>)
                            </div>
                            <div class="styLNDesc"  style="height:10mm;width:26.5mm;padding-top:3mm;border-left-width:0px;
								text-align:center;border-style:solid;border-color:black;border-top-width:0px;border-bottom-width:1px; 
								border-left-width:1px;border-right-width:0px;">(<xsl:number value="($pos + 1)" format="a"/>)
                             </div>
                            <div class="styLNDesc"  style="height:10mm;width:26.5mm;padding-top:3mm;border-left-width:0px;
								text-align:center;border-style:solid;border-color:black;border-top-width:0px;border-bottom-width:1px; 
								border-left-width: 1px; border-right-width: 0px;">(<xsl:number value="($pos + 2)" format="a"/>)
                             </div>
                        </div>
<!-- End Line 1 -->
<!-- Start Line 1a Employee security training/ background checks-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:4.5mm;padding-top:3.5mm;">a
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:4.5mm;padding-top:3.5mm;">
								<span style="float:left;clear:none;"> 
									Employee security training and background checks
								</span>	
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;font-size:8pt;width:6mm;padding-top:3.8mm;
								border-right-width:1px;">1a                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:4.5mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/EmployeeTrainingChecksAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:4.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/EmployeeTrainingChecksAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:4.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/EmployeeTrainingChecksAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1a -->
<!-- Start Line 1b Limitation/ prevention of access to controls-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:10mm;padding-top:3.3mm;">b
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:3.3mm;">
								Limitation and prevention of access to controls of agricultural<br/>
								chemicals stored
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">..............</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;font-size:8pt;width:6mm;padding-top:6.9mm;
								border-right-width:1px;">1b                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.6mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/LimitationPrvntAccessAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.6mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/LimitationPrvntAccessAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.6mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/LimitationPrvntAccessAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1b -->
<!-- Start Line 1c Tagging/ locking tank valves/ chemical additives -->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:10mm;padding-top:3.3mm;">c
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:3.3mm;">
								Tagging, locking tank valves, and chemical additives to prevent
								theft or to render chemicals unfit for illegal use
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;"></span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;font-size:8pt;width:6mm;padding-top:6.8mm;
								border-right-width:1px;">1c                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.5mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/TagLockValveAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/TagLockValveAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/TagLockValveAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1c -->
<!-- Start Line 1d Perimeter protection-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:4mm;padding-top:3.5mm;">d
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:4mm;padding-top:3.5mm;">
								<span style="float:left;clear:none;"> 
									Perimeter protection of agricultural chemicals
								</span>	
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.....</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;font-size:8pt;width:6mm;padding-top:3.9mm;
								border-right-width:1px;">1d                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:4.6mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/PerimeterProtectionAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:4.6mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/PerimeterProtectionAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:4.6mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/PerimeterProtectionAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1d -->
<!-- Start Line 1e Security lighting/ cameras/ recording equipment/ intrusion detection sensors -->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:10mm;padding-top:3.3mm;">e
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:3.3mm;">
								Installation of security lighting, cameras, recording equipment,
								and intrusion detection sensors
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">.....</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;font-size:8pt;width:6mm;padding-top:6.6mm;
								border-right-width:1px;">1e                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/LightingCameraRecSensorsAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/LightingCameraRecSensorsAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/LightingCameraRecSensorsAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1e -->
<!-- Start Line 1f Computer/ computer network security-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:10mm;padding-top:3.3mm;">f
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:3.3mm;">
								Implementation of measures to increase computer or computer
								network security
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">...........</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;font-size:8pt;width:6mm;padding-top:6.7mm;
								border-right-width:1px;">1f                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.4mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/CmptrNtwrkSecImplementationAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.4mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/CmptrNtwrkSecImplementationAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.4mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/CmptrNtwrkSecImplementationAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1f -->
<!-- Start Line 1g Security vulnerability assessment -->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:6mm;padding-top:4.5mm;">g
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:6mm;padding-top:4.7mm;">
								<span style="float:left;clear:none;"> 
									Conducting a security vulnerability assessment
								</span>	
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">....</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;font-size:8pt;width:6mm;padding-top:4.8mm;
								border-right-width:1px;">1g                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:5.5mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/SecurityVulnerabilityAssmntAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:5.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/SecurityVulnerabilityAssmntAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:5.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/SecurityVulnerabilityAssmntAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1g -->
<!-- Start Line 1h Site security plan -->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:6mm;padding-top:4.3mm;">h
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:6mm;padding-top:4.3mm;">
								<span style="float:left;clear:none;"> 
									Implementing a site security plan
								</span>	
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.........</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;font-size:8pt;width:6mm;padding-top:4.7mm;
								border-right-width:1px;">1h                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:5.4mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/SiteSecurityPlanAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:5.4mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/SiteSecurityPlanAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:5.4mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/SiteSecurityPlanAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1h -->
<!-- Start Line 2 Total of Qualified Costs-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftNumBox" style="height:10mm;padding-top:3.3mm;">2
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:3.3mm;">
										Total qualified agricultural chemicals security costs. Add the<br/>
										amounts in columns (a), (b), and (c) on lines 1a through 1h
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;"></span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;font-size:8pt;width:6mm;padding-top:6.8mm;
								border-right-width:1px;">2                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.5mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/TotalQualifiedAgricChmclSecAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/TotalQualifiedAgricChmclSecAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/TotalQualifiedAgricChmclSecAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 2 -->
<!-- Start Line 3 Percent of Qualified Costs -->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftNumBox" style="height:10mm;padding-top:3.3mm;">3
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:3.3mm;">								
										Multiply the amounts in columns (a), (b), and (c) on line 2 by 30%									
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">..................</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;font-size:8pt;width:6mm;padding-top:6.8mm;
								border-right-width:1px;">3                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.5mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/PercentQualifiedCostAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/PercentQualifiedCostAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:7.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/PercentQualifiedCostAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 3 -->
<!-- Start Line 4 Max Credit: Subtract total credit claimed in prior 5 years from $100,000-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftNumBox" style="height:10mm;padding-top:3.3mm;">4
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:3.3mm;">
										Maximum credit per facility. Subtract the total of the credits
										claimed for the facility in the 5 prior tax years from $100,000
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;"></span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;font-size:8pt;width:6mm;padding-top:7.5mm;
								border-right-width:1px;">4                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:11.7mm;width:26.5mm;padding-top:5mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/FacilityMaximumCreditAmt"/>
									</xsl:call-template>
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/FacilityMaximumCreditAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                     style="height:11.7mm;width:26.5mm;padding-top:5mm;font-size:6.3pt;border-left-width:1px;">
                                     <span  style="padding-top:0mm;">
                                     <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/FacilityMaximumCreditAmt"/>
									</xsl:call-template>
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/FacilityMaximumCreditAmt"/>
                                    </xsl:call-template></span>
                            </div>        
                             <div class="styLNAmountBox" 
                                    style="height:11.7mm;width:26.5mm;padding-top:5mm;font-size:6.3pt;border-left-width:1px;clear:none;">
                                    <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/FacilityMaximumCreditAmt"/>
									</xsl:call-template>
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/FacilityMaximumCreditAmt"/>
                                    </xsl:call-template>
                            </div>        
                        </div>
<!-- End Line 4 -->
<!-- Start Line 5 Enter smaller of line 3 or 4-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftNumBox" style="height:10mm;padding-top:3.3mm;">5
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:3.3mm;">
										Agricultural chemicals security credit. Enter the smaller of line 3 or 
										line 4 for each facility. For additional facilities, see instructions
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">.................</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:15mm;font-size:8pt;width:6mm;padding-top:10.9mm;
								border-right-width:1px;">5                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:15mm;width:26.5mm;padding-top:8mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/AgriculturalChemicalsSecCrAmt"/>
									</xsl:call-template>
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/AgriculturalChemicalsSecCrAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:15mm;width:26.5mm;padding-top:8mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/AgriculturalChemicalsSecCrAmt"/>
									</xsl:call-template>
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/AgriculturalChemicalsSecCrAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:15mm;width:26.5mm;padding-top:8mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/AgriculturalChemicalsSecCrAmt"/>
									</xsl:call-template>
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/AgriculturalChemicalsSecCrAmt"/>
                                    </xsl:call-template>
                            </div>
  									</div>
  									      </div>
								</xsl:if>
							</xsl:for-each>
							
							
 						<!--Start Printing Blank Section for Qualified Costs -->
						<xsl:if test="(count($Form8931Data/QlfyAgricChemicalsSecCostsGrp) &lt; 1)">
							<xsl:variable name="pos" select="position()"/>
<div style="width:187mm;">
        <th style="width:187mm;">
            <div class="styLNDesc" style="width:101.2mm;height:4mm;"></div>
            <div class="styLNDesc" style="width:85.5mm;height:4mm;padding-left:40mm;border-style:solid;border-right-width:0px;
				border-left-width:1px;border-top-width:0px;border-bottom-width:1px;border-color:black;float:left;clear:none;">
						<b>Facility</b></div>
		</th>
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftNumBox" style="height:10mm;padding-top:2.5mm;">1
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:2.5mm;">
								Enter on the applicable line below the qualified agricultural<br/>
								chemicals security costs described (see instructions)
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">..</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:10mm;width:6mm;padding-top:0mm;
								border-right-width:1px;background-color:lightgrey;">                            
                            </div>
                            <div class="styLNDesc"  style="height:10mm;width:26.5mm;padding-top:3mm;border-left-width:0px;
								text-align:center;border-style:solid; border-color:black;border-top-width:0px;border-bottom-width:1px; 
								border-left-width: 0px; border-right-width: 0px;">(<xsl:number value="($pos)" format="a"/>)
                            </div>
                            <div class="styLNDesc"  style="height:10mm;width:26.5mm;padding-top:3mm;border-left-width:0px;
								text-align:center;border-style:solid;border-color:black;border-top-width:0px;border-bottom-width:1px; 
								border-left-width:1px;border-right-width:0px;">(<xsl:number value="($pos + 1)" format="a"/>)
                             </div>
                            <div class="styLNDesc"  style="height:10mm;width:26.5mm;padding-top:3mm;border-left-width:0px;
								text-align:center;border-style:solid;border-color:black;border-top-width:0px;border-bottom-width:1px; 
								border-left-width: 1px; border-right-width: 0px;">(<xsl:number value="($pos + 2)" format="a"/>)
                             </div>
                        </div>
<!-- End Line 1 -->
<!-- Start Line 1a Employee security training/ background checks-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:4.5mm;padding-top:2.5mm;">a
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:4.5mm;padding-top:2.5mm;">
								<span style="float:left;clear:none;"> 
									Employee security training and background checks
								</span>	
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:6mm;font-size:8pt;width:6mm;padding-top:2.5mm;
								border-right-width:1px;">1a                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:6mm;width:26.5mm;padding-top:4.5mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/EmployeeTrainingChecksAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:6mm;width:26.5mm;padding-top:4.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/EmployeeTrainingChecksAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:6mm;width:26.5mm;padding-top:4.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/EmployeeTrainingChecksAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1a -->
<!-- Start Line 1b Limitation/ prevention of access to controls-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:10mm;padding-top:3.3mm;">b
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:3.3mm;">
								Limitation and prevention of access to controls of agricultural<br/>
								chemicals stored
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">...............</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:10mm;font-size:8pt;width:6mm;padding-top:6.5mm;
								border-right-width:1px;">1b                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:10mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/LimitationPrvntAccessAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:10mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/LimitationPrvntAccessAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:10mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/LimitationPrvntAccessAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1b -->
<!-- Start Line 1c Tagging/ locking tank valves/ chemical additives -->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:10mm;padding-top:4mm;">c
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:4mm;">
								Tagging, locking tank valves, and chemical additives to prevent
								theft or to render chemicals unfit for illegal use
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:.5mm;clear:none;">.</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:10.5mm;font-size:8pt;width:6mm;padding-top:6.5mm;
								border-right-width:1px;">1c                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:10.5mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/TagLockValveAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:10.5mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/TagLockValveAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:10.5mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/TagLockValveAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1c -->
<!-- Start Line 1d Perimeter protection-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:4mm;padding-top:3.5mm;">d
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:4mm;padding-top:3.5mm;">
								<span style="float:left;clear:none;"> 
									Perimeter protection of agricultural chemicals
								</span>	
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.....</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:6.5mm;font-size:8pt;width:6mm;padding-top:3.3mm;
								border-right-width:1px;">1d                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:6.5mm;width:26.5mm;padding-top:4.5mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/PerimeterProtectionAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:6.5mm;width:26.5mm;padding-top:4.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/PerimeterProtectionAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:6.5mm;width:26.5mm;padding-top:4.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/PerimeterProtectionAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1d -->
<!-- Start Line 1e Security lighting/ cameras/ recording equipment/ intrusion detection sensors -->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:10mm;padding-top:4mm;">e
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:4mm;">
								Installation of security lighting, cameras, recording equipment,
								and intrusion detection sensors
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:.5mm;clear:none;">......</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:10.5mm;font-size:8pt;width:6mm;padding-top:6.5mm;
								border-right-width:1px;">1e                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:10.5mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/LightingCameraRecSensorsAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:10.5mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/LightingCameraRecSensorsAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:10.5mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/LightingCameraRecSensorsAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1e -->
<!-- Start Line 1f Computer/ computer network security-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:10mm;padding-top:4mm;">f
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:4mm;">
								Implementation of measures to increase computer or computer
								network security
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:.5mm;clear:none;">............</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:10.5mm;font-size:8pt;width:6mm;padding-top:6.5mm;
								border-right-width:1px;">1f                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:10.5mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/CmptrNtwrkSecImplementationAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:10.5mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/CmptrNtwrkSecImplementationAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:10.5mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/CmptrNtwrkSecImplementationAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1f -->
<!-- Start Line 1g Security vulnerability assessment -->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:6mm;padding-top:4.5mm;">g
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:6mm;padding-top:4.7mm;">
								<span style="float:left;clear:none;"> 
									Conducting a security vulnerability assessment
								</span>	
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">....</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7.5mm;font-size:8pt;width:6mm;padding-top:3.5mm;
								border-right-width:1px;">1g                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:26.5mm;padding-top:5.3mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/SecurityVulnerabilityAssmntAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:26.5mm;padding-top:5.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/SecurityVulnerabilityAssmntAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:7.5mm;width:26.5mm;padding-top:5.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/SecurityVulnerabilityAssmntAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1g -->
<!-- Start Line 1h Site security plan -->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftLtrBox" style="height:6mm;padding-top:4.3mm;">h
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:6mm;padding-top:4.3mm;">
								<span style="float:left;clear:none;"> 
									Implementing a site security plan
								</span>	
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.........</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:7mm;font-size:8pt;width:6mm;padding-top:3.6mm;
								border-right-width:1px;">1h                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7mm;width:26.5mm;padding-top:5.3mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/SiteSecurityPlanAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:7mm;width:26.5mm;padding-top:5.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/SiteSecurityPlanAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:7mm;width:26.5mm;padding-top:5.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/SiteSecurityPlanAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1h -->
<!-- Start Line 2 Total of Qualified Costs-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftNumBox" style="height:10mm;padding-top:4mm;">2
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:10mm;padding-top:4mm;">
										Total qualified agricultural chemicals security costs. Add the<br/>
										amounts in columns (a), (b), and (c) on lines 1a through 1h
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;"></span>
                            </div>
                            <div class="styLNRightNumBox" style="height:10.5mm;font-size:8pt;width:6mm;padding-top:6.5mm;
								border-right-width:1px;">2                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:10.5mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/TotalQualifiedAgricChmclSecAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:10.5mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/TotalQualifiedAgricChmclSecAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:10.5mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/TotalQualifiedAgricChmclSecAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 2 -->
<!-- Start Line 3 Percent of Qualified Costs -->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftNumBox" style="height:4mm;padding-top:4mm;">3
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:4mm;padding-top:4mm;">
									<!--<span style="float:left;clear:none;">--> 
										Multiply the amounts in columns (a), (b), and (c) on line 2 by 30%
										 <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">..................</span>
									<!--</span>-->	
        <!--Dotted Line-->
                                <!--<span class="styDotLn" style="float:right;padding-left:2mm;clear:none;">.</span>-->
                            </div>
                            <div class="styLNRightNumBox" style="height:11mm;font-size:8pt;width:6mm;padding-top:7mm;
								border-right-width:1px;">3                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:11mm;width:26.5mm;padding-top:4.5mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/PercentQualifiedCostAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:11mm;width:26.5mm;padding-top:4.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/PercentQualifiedCostAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:11mm;width:26.5mm;padding-top:4.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/PercentQualifiedCostAmt"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 3 -->
<!-- Start Line 4 Max Credit: Subtract total credit claimed in prior 5 years from $100,000-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftNumBox" style="height:7mm;padding-top:3.5mm;">4
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:7mm;padding-top:3.5mm;">
										Maximum credit per facility. Subtract the total of the credits<br/>
										claimed for the facility in the 5 prior tax years from $100,000
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;"></span>
                            </div>
                            <div class="styLNRightNumBox" style="height:11.7mm;font-size:8pt;width:6mm;padding-top:7.8mm;
								border-right-width:1px;">4                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:11.7mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/FacilityMaximumCreditAmt"/>
									</xsl:call-template>
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/FacilityMaximumCreditAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                     style="height:11.7mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;">
                                     <span  style="padding-top:8.3mm;">
                                     <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/FacilityMaximumCreditAmt"/>
									</xsl:call-template>
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/FacilityMaximumCreditAmt"/>
                                    </xsl:call-template></span>
                            </div>        
                             <div class="styLNAmountBox" 
                                    style="height:11.7mm;width:26.5mm;padding-top:7.3mm;font-size:6.3pt;border-left-width:1px;clear:none;">
                                    <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/FacilityMaximumCreditAmt"/>
									</xsl:call-template>
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/FacilityMaximumCreditAmt"/>
                                    </xsl:call-template>
                            </div>        
                        </div>
<!-- End Line 4 -->
<!-- Start Line 5 Enter smaller of line 3 or 4-->
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftNumBox" style="height:7mm;padding-top:2mm;">5
                            </div>
                            <div class="styLNDesc" style="width:93.2mm;height:7mm;padding-top:2mm;">
										Agricultural chemicals security credit. Enter the smaller of line 3 or 
										line 4 for each facility. For additional facilities, see instructions
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:2mm;clear:none;">.................</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:13mm;font-size:8pt;width:6mm;padding-top:8.7mm;
								border-right-width:1px;">5                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:13mm;width:26.5mm;padding-top:7.5mm;font-size:6.3pt;border-left-width:0px;">
                                    <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/AgriculturalChemicalsSecCrAmt"/>
									</xsl:call-template>
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos]/AgriculturalChemicalsSecCrAmt"/>
                                    </xsl:call-template>
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:13mm;width:26.5mm;padding-top:7.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/AgriculturalChemicalsSecCrAmt"/>
									</xsl:call-template>
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 1]/AgriculturalChemicalsSecCrAmt"/>
                                    </xsl:call-template>
                            </div>
                             <div class="styLNAmountBox" 
                                    style="height:13mm;width:26.5mm;padding-top:7.5mm;font-size:6.3pt;border-left-width:1px;">
                                    <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/AgriculturalChemicalsSecCrAmt"/>
									</xsl:call-template>
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8931Data/QlfyAgricChemicalsSecCostsGrp[$pos + 2]/AgriculturalChemicalsSecCrAmt"/>
                                    </xsl:call-template>
                            </div>
  									</div>
  									      </div>
							
						</xsl:if>
<!-- Start Line 6 Add amounts on line 5 (up to $2,000,000) -->
                        
                        <div style="width:187mm;font-size:8pt">
                            <div class="styLNLeftNumBox" style="height:8mm;padding-top:4.5mm;">6
                            </div>
                            <div class="styLNDesc" style="width:146mm;height:8mm;padding-top:4.5mm;">
								<span style="float:left;clear:none;"> 
									Add the amounts for all facilities on line 5 
								</span>	
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...................</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;width:6mm;padding-top:4.6mm;border-right-width:0px">6
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:5.3mm;font-size:6.3pt;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8931Data/TotalAllFacilitiesAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 6 -->
<!-- Start Line 7 Credits from partnerships, S corporations, estates and trusts-->
                        
                        <div style="width:187mm;font-size:8pt">
                            <div class="styLNLeftNumBox" style="height:8mm;padding-top:4.5mm;">7
                            </div>
                            <div class="styLNDesc" style="width:146mm;height:8mm;padding-top:4.5mm;">
								<span style="float:left;clear:none;"> 
									Credit from partnerships, S corporations, estates, and trusts
								</span>	
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">............</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;width:6mm;padding-top:4.5mm;border-right-width:0px">7
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:5.3mm;font-size:6.3pt;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8931Data/PartnershipSCorpEstCreditAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 7 -->
<!-- Start Line 8 -->
                        
                        <div style="width:187mm;font-size:8.5pt">
                            <div class="styLNLeftNumBox" style="height:8mm;padding-top:3mm;">8
                            </div>
                            <div class="styLNDesc" style="width:146mm;height:8mm;padding-top:3mm;">
								Add lines 6 and 7. Enter the result, but not more than $2,000,000. Estates and trusts, go to<br/>
								line 9; partnerships and S corporations, report this amount on Schedule K; all others, report<br/>
								this amount on the appropriate line of Form 3800 (e.g., line 1v of the 2010 Form 3800)
        <!--Dotted Line-->
                                <span class="styDotLn" style="float:none;padding-left:2mm;clear:none;">..</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;width:6mm;padding-top:10.1mm;border-right-width:0px">8
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:11.1mm;font-size:6.3pt;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8931Data/ReportCreditAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 8 -->
<!-- Start Line 9 Amount allocated to beneficiaries of estates and trusts-->
                        
                        <div style="width:187mm;font-size:8pt">
                            <div class="styLNLeftNumBox" style="height:8mm;padding-top:4.5mm;">9
                            </div>
                            <div class="styLNDesc" style="width:146mm;height:8mm;padding-top:4.5mm;">
								<span style="float:left;clear:none;"> 
									Amount allocated to beneficiaries of the estate or trust (see instructions)
								</span>	
        <!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">........</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;width:6mm;padding-top:4.5mm;border-right-width:0px">9
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:5.3mm;font-size:6.3pt;border-left-width:1px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8931Data/EstateTrustBenefAllocatedAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 9 -->
<!-- Start Line 10 Estates and trusts: subtract line 9 from line 8-->
                        
                        <div style="width:187mm;font-size:8pt">
                            <div class="styLNLeftNumBox" style="">10
                            </div>
                            <div class="styLNDesc" style="width:146mm;">
								Estates and trusts, subtract line 9 from line 8. Report the credit on the appropriate line of Form<br/>
								3800 (e.g., line 1v of the 2010 Form 3800)
        <!--Dotted Line-->
								<span class="styDotLn" style="float:none;padding-left:2mm;clear:none;">..................</span>
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;width:6mm;padding-top:4.6mm;border-right-width:0px;border-bottom-width:0px;">10
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:26.5mm;padding-top:5.3mm;font-size:6.3pt;border-left-width:1px;border-bottom-width:0px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8931Data/EstateTrustCreditAmt"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 10 -->

   <!--  FOOTER-->
        <div style="width:187mm;padding-top:1mm;border-top:1px solid black;">
          <span class="styBoldText"  style="width:109.5mm">For Paperwork Reduction Act Notice, see page 2. </span> 
          <span style="width:30mm;font-size:6pt">Cat. No. 37745A</span>                      
          
          <span style="width:15mm;"></span>  
          Form <span class="styBoldText" style="font-size:8.5pt">8931</span> (12-2010)
        </div> 
        <p style="page-break-before: always"/>
             
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1"  type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        
        <!-- Additional Data Table -->
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$Form8931Data" />
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>                   
        </table>
      <!-- END Left Over Table --> 
      
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
