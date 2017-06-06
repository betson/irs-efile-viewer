<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS7004Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS7004"/>
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
        <meta name="Description" content="Form IRS7004"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS7004Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form7004">
          <xsl:call-template name="DocumentHeader"/>
          <!--Title of Form7004 -->
          <div class="styBB" style="width:187mm;height: 20mm">
            <div class="styFNBox" style="height:25mm; width:33mm;font-size: 9pt; 
	        padding-top:2mm;">Form <span class="styFormNumber">7004</span>
              <br/>
              <span class="styAgency" style="font-weight:bold; ">
     		(Rev. December 2009)</span>
              <span style="padding-left:2mm">
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData"/>
                </xsl:call-template>
              </span>
              <div>
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:123mm; height: 25mm">
              <div class="styMainTitle" style="padding-top:2mm;font:11pt;font-weight:bold">
        Application for Automatic Extension of Time To File <br/>
	    Certain Business Income Tax, Information, and Other Returns<br/>
              </div>
              <div class="styMainTitle" style="font:7pt;font-weight:normal;padding-top:5mm;">
                <br/>
                <div class="styFBT" style="height:5mm;">
                  <img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
            File a separate application for each return.
    </div>
              </div>
            </div>
            <div class="styTYBox" style="width:31mm; height: 25mm">
              <div style="padding-top:10mm; font-size:7pt;font-weight:bold;">OMB No. 1545-0233</div>
            </div>
          </div>
          <!--  End title of Form  -->
          <div class="styGenericDiv" style="width:187mm;">
            <div class="styIRS7004TextBox" style="font-size:9pt; width:17mm; height:31mm;border-bottom-width:0px">
              <span class="styBoldText">Type or print<br/>
                <br/>
              </span>
              <span class="styArialText" style="font-weight:bold;">
   	      File by the due date for the return for which an extension is
   	      requested. See instructions.</span>
            </div>
            <!-- name   -->
            <div class="styIRS7004TextBox" style="font-size:7pt;width:114mm;height:10mm;
  		padding-left:2mm;border-bottom-width:0px;">Name
	<div style="padding-left:5mm; line-height:110%">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                </xsl:call-template>
              </div>
              <!-- end name -->
            </div>
            <!-- Taxpayer identification number -->
            <div class="styIRS7004TextBox" style="font-size:7pt;width:55mm;height:10mm;
  		padding-left:2mm;border-right-width:0px;border-bottom-width:0px;">
              <span class="styBoldText">Identifying number</span>
              <div style="text-align:left; width:100%; padding-top:4mm; font-weight:normal">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="EINChanged">true</xsl:with-param>
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- end Taxpayer identification number -->
            <!-- Number, street, and room or suite no. if P.O. box -->
            <div class="styIRS7004TextBox" style="font-size:7pt;width:169mm;height:8mm;
            border-top-width:1px;border-right-width:0px;padding-left:2mm">
          	Number, street, and room or suite no. if P.O. box,
          	 see instructions.
   	<div style="padding-left:5mm; line-height:110%">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
            <!-- end Number, street, and room or suite no. if P.O. box -->
            <!-- City or town -->
            <div class="styIRS7004TextBox" style="font-size:7pt;width:169mm;height:12mm;
	        border-right-width: 0px;border-bottom-width: 0px;padding-left:2mm">
			City, town, state, and ZIP code (If a foreign address, enter city, province or state, and country (follow the country’s practice for entering
            postal code)).
 	    <div style="padding-left:5mm">
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
          </div>
          <div class="styBB" style="font-size:9pt; width:187mm; height:4mm; border-bottom-width: 0px;
	         border-top-width: 1px;">
            <span class="styBoldText">Note. See instructions before completing this form.</span>
          </div>
          <!-- BEGIN Part I Title -->
          <div class="styBB" style="width:187mm;border-top-width:1px;">
            <div class="styPartName" style="width:23mm;">Part I</div>
            <div class="styPartDesc" style="width:164mm;">Automatic 5-Month Extension<span class="styNormalText">
       Complete if Filing Form 1065, 1041, or 8804</span>
            </div>
          </div>
          <!-- END Part I Title -->
          <!-- line 1a -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:5mm;">1a</div>
            <div class="styLNDesc" style="width:171mm;height:5mm;">
              <span style="float:left">Enter the form code for the return 
							that this application is for (see below)
                            </span>
              <span class="styBoldText" style="padding-right:1mm">
                <span style="width:3px;"/>.
                    		<span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                            <span style="width:16px;"/>.
                           <span style="width:16px;"/>.
                           </span>
            </div>
            <div class="styFNBox" style="border-right-width: 1px;border-left-width: 1px;
						 border-bottom-width: 0px;border-top-width: 0px;height:5mm;width:8mm;
						 padding-left:2mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/ReturnCodeForAuto5MonthExtns"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- end line 1 -->
          <!-- Table Header Line1 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 01px;
	                   border-left-width: 0px;border-right-width: 0px;border-bottom-width:1px;
	                   padding-top:.5mm;">
              <span style="font-size: 8pt;font-weight:bold;text-align:left;
		                   float:left; clear: none;">Application<br/> Is For:</span>
            </div>
            <div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width:1px;
						border-left-width:1px;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                      padding-left:1mm">
              <span style="font-size: 8pt;font-weight:bold;text-align:left;
		            float:left; clear: none;"> Form<br/>Code</span>
            </div>
            <div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 1px;
	                    border-left-width: 1px;border-right-width: 0px;border-bottom-width: 1px;
	                    padding-top:.5mm;padding-left:2mm">
              <span style="font-size: 8pt;font-weight:bold;text-align:left;
		              float:left; clear: none;">Application<br/> Is For:</span>
            </div>
            <div class="styLNAmountBox" style="height:5mm;width:14mm;border-top-width:1px;
	                    border-left-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                        padding-left:1mm">
              <span style="font-size: 8pt;font-weight:bold;text-align:left;
			            float:left; clear: none;"> Form<br/>Code</span>
            </div>
          </div>
          <!-- end Table Heder line1 -->
          <!--  ************************************************************************** -->
          <!-- Table line 1 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
                ;border-left-width:0px;border-right-width: 0px;border-bottom-width: 1px;
                padding-top:.5mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1065</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">09</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:2mm;background-color:lightgrey;">
              <span style="font-size: 9pt;text-align:left;
			        float:left; clear: none;">Form 1041 (estate)</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                    padding-right:4mm;clear: none;">04</span>
            </div>
          </div>
          <!-- end table line1 -->
          <!-- Table line 2 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
                ;border-left-width:0px;border-right-width:0px;border-bottom-width: 0px;
                padding-top:.5mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 8804</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 0px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">31</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
						border-left-width: 1px;border-right-width: 0px;border-bottom-width: 0px;padding-top:.5mm
                ;padding-left:2mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1041 (trust)</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 0px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">05</span>
            </div>
          </div>
          <!-- end Table line2 -->
          <!--  ************************************************************************** -->
          <!-- BEGIN Part II Title -->
          <div class="styBB" style="width:187mm;border-top-width:1px;">
            <div class="styPartName" style="width:23mm;">Part II</div>
            <div class="styPartDesc" style="width:164mm;">Automatic 6-Month Extension<span class="styNormalText">
       Complete if Filing Other Forms</span>
            </div>
          </div>
          <!-- END Part II Title -->
          <!-- line 1b -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;padding-left:2mm">b</div>
            <div class="styLNDesc" style="width:171mm;height:4mm;">
              <span style="float:left">Enter the form code for the return that this application 
	    	is for (see below)
        </span>
              <span class="styBoldText" style="padding-right:1mm">
                <span style="width:3px;"/>.
		<span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.
        <span style="width:16px;"/>.

        </span>
            </div>
            <div class="styFNBox" style="border-right-width: 1px;border-left-width: 1px; 
					        border-bottom-width: 0px;border-top-width: 0px;
					        height: 4mm;width:4mm;width:8mm;padding-left:2mm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$FormData/ReturnCodeForAuto6MonthExtns"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- end line 1b -->
          <!-- line 1T -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 01px;
	               border-left-width: 0px;border-right-width: 0px;border-bottom-width:1px;
	               padding-top:.5mm;">
              <span style="font-size: 8pt;font-weight:bold;text-align:left;
		            float:left; clear: none;">Application<br/> Is For:</span>
            </div>
            <div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 1px;border-left-width: 1px
                   ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                      padding-left:1mm">
              <span style="font-size: 8pt;font-weight:bold;text-align:left;
		            float:left; clear: none;"> Form<br/>Code</span>
            </div>
            <div class="styLNAmountBox" style="height:5mm;width:80mm;border-top-width: 1px;
	                    border-left-width: 1px;border-right-width: 0px;border-bottom-width: 1px;
	                    padding-top:.5mm;padding-left:2mm">
              <span style="font-size: 8pt;font-weight:bold;text-align:left;
		              float:left; clear: none;">Application<br/> Is For:</span>
            </div>
            <div class="styLNAmountBox" style="height:4.5mm;width:14mm;border-top-width:1px;
	                    border-left-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                        padding-left:1mm">
              <span style="font-size: 8pt;font-weight:bold;text-align:left;
			            float:left; clear: none;"> Form<br/>Code</span>
            </div>
          </div>
          <!-- end line1T -->
          <!--  ************************************************************************** -->
          <!-- Table line 1 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
            border-left-width:0px;border-right-width: 0px;border-bottom-width: 1px;
            padding-top:.5mm;">
              <span style="font-size: 9pt;text-align:left;
		   float:left; clear: none;">Form 706-GS(D)</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
            ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
            padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
            padding-right:4mm;clear: none;">01</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
            ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm;
            padding-left:2mm;background-color:lightgrey;">
              <span style="font-size: 9pt;text-align:left;
			float:left; clear: none;">Form 1120-PC</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                    padding-right:4mm;clear: none;">21</span>
            </div>
          </div>
          <!-- end table line1 -->
          <!-- Table line 2 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 706-GS(T)</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">02</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1120-POL</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">22</span>
            </div>
          </div>
          <!-- end Table line2 -->
          <!-- Table line 3 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1041-N</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">06</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1120-REIT</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">23</span>
            </div>
          </div>
          <!-- end Table line3 -->
          <!-- Table line 4 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1041-QFT</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">07</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1120-RIC</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">24</span>
            </div>
          </div>
          <!-- end Table line4 -->
          <!-- Table line 5 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1042</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">08</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1120 S</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">25</span>
            </div>
          </div>
          <!-- end Table line5 -->
          <!-- Table line 6 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1065-B</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">10</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1120-SF</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">26</span>
            </div>
          </div>
          <!-- end Table line6 -->
          <!-- Table line 7 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1066</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">11</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 3520-A</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">27</span>
            </div>
          </div>
          <!-- end Table line7 -->
          <!-- Table line 8 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1120</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">12</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 8612</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">28</span>
            </div>
          </div>
          <!-- end Table line8 -->
          <!-- Table line 9 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1120-C</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">34</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 8613</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">29</span>
            </div>
          </div>
          <!-- end Table line9 -->
          <!-- Table line 10 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1120-F</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">15</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 8725</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">30</span>
            </div>
          </div>
          <!-- end Table line10 -->
          <!-- Table line 11 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1120-FSC</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">16</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 8831</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">32</span>
            </div>
          </div>
          <!-- end Table line11 -->
          <!-- Table line 12 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1120-H</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">17</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 8876</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">33</span>
            </div>
          </div>
          <!-- end Table line12 -->
          <!-- Table line 13 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1120-L</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">18</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 8924</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">35</span>
            </div>
          </div>
          <!-- end Table line13 -->
          <!-- Table line 14 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1120-ND</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">19</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 8928</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">XX</span>
            </div>
          </div>
          <!-- end Table line14 -->
          <!-- Table line 15 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;
               ;border-left-width:0px;border-right-width:0px;border-bottom-width: 1px;
                padding-top:.5mm;">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;">Form 1120-ND (section 4951 taxes)</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 1px;border-bottom-width: 1px;padding-top:.5mm;
                padding-left:1mm;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;">20</span>
            </div>
            <div class="styLNAmountBox" style="height:4mm;width:80mm;border-top-width: 0px;border-left-width: 1px
                ;border-right-width: 0px;border-bottom-width: 1px;padding-top:.5mm
                ;padding-left:2mm;background-color:lightgrey">
              <span style="font-size: 9pt;text-align:left;
		        float:left; clear: none;"/>
            </div>
            <div class="styLNAmountBox" style="height:5mm;width:13mm;border-top-width: 0px;border-left-width: 1px
                ;border-bottom-width: 1px;padding-left:1mm;background-color:lightgrey;">
              <span style="font-size: 9pt;text-align:center;font-weight:bold;
                padding-right:4mm;clear: none;"/>
            </div>
          </div>
          <!-- end Table line15 -->
          <!-- line 2 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">2</div>
            <div class="styLNDesc" style="width:168mm;height:4mm;">
              <span style="float:left">
        If the organization is a foreign corporation that does not have an office 
        or place of business in the United States, check here</span>
              <span class="styBoldText" style="padding-right:1mm">
                <img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
              </span>
            </div>
            <div class="styFNBox" style="border-right-width: 0px;height: 4mm; width:3mm;
                border-top-width: 0px;"/>
            <input type="checkbox" class="styCkbox" name="InitialReturn" id="FrgnCorpDoesNotHaveOfficeInUS">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/FrgnCorpDoesNotHaveOfficeInUS"/>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/FrgnCorpDoesNotHaveOfficeInUS"/>
              </xsl:call-template>
            </label>
          </div>
          <!-- end line2 -->
          <div style="width:187mm"/>
          <!-- line 3 -->
          <div style="width:187mm;height:4mm">
            <div class="styLNLeftNumBox" style="height:4mm;">3</div>
            <div class="styLNDesc" style="width:168mm;height:4mm;">
              <span style="float:left">
		If the organization is a corporation and is the common parent of a group
		 that intends to file a consolidated return,
		 check here</span>
              <span class="styBoldText" style="padding-right:1mm">
                <img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
              </span>
            </div>
            <div class="styFNBox" style="border-right-width: 0px;height: 4mm; width:3mm;
        border-top-width: 0px;"/>
            <input type="checkbox" class="styCkbox" name="InitialReturn" id="FilingUnderRegSect160815">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/CorpForConsolidatedGroup"/>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/CorpForConsolidatedGroup"/>
              </xsl:call-template>
            </label>
          </div>
          <!-- end line3 -->
          <!-- note line 3 -->
          <div style="width:187mm;height:4mm">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:168mm;height:4mm;">
              <span style="float:left">
	If checked, attach a schedule, listing the name, address, and Employer
	Identification Number (EIN) for each member covered by this application.
    <span style="padding-left:2mm"/>
    <xsl:call-template name="SetFormLinkInline">
    <xsl:with-param name="TargetNode" select="$FormData/CorpForConsolidatedGroup"/>
    </xsl:call-template>
   </span>
          </div>
          </div>
          <!-- end notes line3 -->
          <!-- BEGIN Part III Title -->
          <div class="styBB" style="width:187mm;border-top-width:1px;">
            <div class="styPartName" style="width:23mm;">Part III</div>
            <div class="styPartDesc" style="width:164mm;">All Filers Must Complete This Part
    </div>
          </div>
          <!-- END Part III Title -->
          <!-- line 4 -->
          <div style="width:187mm;height:4mm">
            <div class="styLNLeftNumBox" style="height:4mm;">4</div>
            <div class="styLNDesc" style="width:168mm;height:4mm;">
              <span style="float:left">
		If the organization is a corporation or partnership
		 that qualifies under Regulations section 1.6081-5, check here
	</span>
              <span class="styBoldText" style="padding-right:1mm">
                <img src="{$ImagePath}/5471_Bullet_Title.gif" alt="bullet"/>
              </span>
            </div>
            <div class="styFNBox" style="border-right-width: 0px;height: 4mm; width:3mm;
        border-top-width: 0px;"/>
            <input type="checkbox" class="styCkbox" name="InitialReturn" id="InitialReturn">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/FilingUnderRegSect160815"/>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/FilingUnderRegSect160815"/>
              </xsl:call-template>
            </label>
          </div>
          <!-- end line4 -->
          <!-- line 5a -->
          <div style="width:187mm;height:4mm">
            <div class="styLNLeftNumBox" style="height:4mm;">5a
        </div>
            <div class="styGenericDiv">
         The application is for calendar year 
         <span style="width: 10mm;border-bottom:1 solid black">
                <xsl:call-template name="PopulateReturnHeaderTaxYear"/>
              </span>, or other tax year beginning
        <span style="width: 18mm;border-bottom:1 solid black;">
                <!-- No need to send the parameters -->
                <xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
              </span>, and ending 
        <span style="width: 18mm;border-bottom:1 solid black;">
                <!-- No need to send the parameters -->
                <xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
              </span>
            </div>
          </div>
          <!-- end line 5a -->
          <div style="width:187mm"/>
          <!-- line 5b -->
          <div style="width:187mm;height:5mm;padding-left:3mm;font-weight:bold;">
                b<span style="font-weight:bold;padding-left:3mm">Short tax year.</span>
            <span style="font-weight:normal;"> If this tax year is less than 12 months, check the reason:</span>
          </div>
          <div class="styGenericDiv" style="width:187mm;">
            <div class="styGenericDiv" style="padding-left:8mm;width:30mm;">
              <input type="checkbox" class="styCkbox" name="InitialReturn" id="InitialReturn">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/InitialReturn"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/InitialReturn"/>
                </xsl:call-template>
						Initial return
					</label>
            </div>
            <div class="styGenericDiv" style="padding-left:8mm;width:30mm;">
              <input type="checkbox" class="styCkbox" name="FinalReturn" id="FinalReturn">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/FinalReturn"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/FinalReturn"/>
                </xsl:call-template>
						Final return
					</label>
            </div>
            <div class="styGenericDiv" style="padding-left:8mm;width:50mm;">
              <input type="checkbox" class="styCkbox"
               name="ChangeInAccountingPeriod" id="ChangeInAccountingPeriod">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/ChangeInAccountingPeriod"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/ChangeInAccountingPeriod"/>
                </xsl:call-template>
						Change in accounting period
					</label>
            </div>
            <div class="styGenericDiv" style="padding-left:8mm;width:60mm;">
              <input type="checkbox" class="styCkbox"
               name="ConsolidatedReturnToBeFiled" id="ConsolidatedReturnToBeFiled">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/ConsolidatedReturnToBeFiled"/>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/ConsolidatedReturnToBeFiled"/>
                </xsl:call-template>
						Consolidated return to be filed
					</label>
            </div>
          </div>
          <!-- end line 5b -->
          <div style="width:187mm"/>
          <!-- Start line 6 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;float:left;font-weight:bold">
              <span style="font-weight:normal"/>
            </div>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px;"/>
          </div>
          <!-- End line 6 -->
          <!-- Start line 6a -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">6
          </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
              <span style="float:left;font-weight:normal">
            Tentative total tax</span>
              <span class="styBoldText" style="float:right;padding-right:1mm">
                <span style="width:1px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            </span>
            </div>
            <div class="styLNRightNumBox">6</div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TentativeTax"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Start line 7 -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;float:left;font-weight:bold">
              <span style="font-weight:normal"/>
            </div>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px;"/>
          </div>
          <!-- End line 7 -->
          <!-- Start line 7a -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">7
          </div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;">
              <span style="float:left;font-weight:bold">Total </span>
              <span style="float:left;font-weight:normal;padding-left:1mm"> payments and credits (see instructions)
                   <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Line 7 - Backup Withholding Indicator</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAndRefundableCr/@backupWithholdingIndicator"/>
                </xsl:call-template>
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Line 7 - Backup Withholding Amount</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAndRefundableCr/@backupWithholdingAmount"/>
                  <xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
                </xsl:call-template>
              </span>
              <span class="styBoldText" style="float:right;padding-right:1mm;">
                <span style="width:1px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
             <span style="width:16px;"/>.
            <span style="width:16px;"/>.
             <span style="width:16px;"/>.
            <span style="width:16px;"/>.
             <span style="width:16px;"/>.
            <span style="width:16px;"/>.
             <span style="width:16px;"/>.
            <span style="width:16px;"/>.
             <span style="width:16px;"/>.
             </span>
            </div>
            <div class="styLNRightNumBox">7         
        </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAndRefundableCr"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- End line 7a -->
          <!-- Start line 8a -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;float:left;font-weight:bold">
              <span style="font-weight:normal"/>
            </div>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px;"/>
          </div>
          <!-- End line 8a -->
          <!-- Start line 8b -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;">8</div>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;float:left;font-weight:bold">
              <span style="font-weight:normal">
                <b>
         Balance due. </b>Subtract line 7 from line 6. <b>Generally, you must deposit this amount using the</b>
              </span>
            </div>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px;"/>
          </div>
          <!-- End line 8b -->
          <!-- Start line 8c -->
          <div style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;float:left;font-weight:bold">
              <span style="font-weight:normal">
                <b>
              Electronic Federal Tax Payment System (EFTPS), a Federal Tax Deposit (FTD) Coupon, or </b>
              </span>
            </div>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
            <div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px;"/>
          </div>
          <!-- End line 8c -->
          <!-- Start line 8d -->
          <div class="styBB" style="width:187mm">
            <div class="styLNLeftNumBox" style="height:4mm;"/>
            <div class="styLNDesc" style="width:138.75mm;height:4mm;float:left;font-weight:bold">
              <span style="font-weight:normal">
                <b>
             Electronic Funds Withdrawal (EFW)</b>(see instructions for exceptions)</span>
              <span class="styBoldText">
                <span style="width:2px;"/>.
           <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
            <span style="width:16px;"/>.
        </span>
            </div>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;">8</div>
            <div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$FormData/BalanceDue"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- End line 8d -->
          <!-- form end -->
          <div style="width:187mm;clear:both;">
            <div style="width:100mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see instructions.</div>
            <div style="width:45mm;text-align:center;" class="styGenericDiv">Cat. No. 13804A</div>
            <div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">7004</span> (Rev. 12-2009)</div>
          </div>
          <!-- br class="pageEnd"/ -->
          <!-- Begininning of write-in data -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
              <br/>
				Additional Data				
			</div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 7 - Backup Withholding Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAndRefundableCr/@backupWithholdingIndicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRowAmount">
              <xsl:with-param name="Desc">Line 7 - Backup Withholding Amount</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAndRefundableCr/@backupWithholdingAmount"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Line 8 - Online users and large corporations consent to the ACH debit agreement Indicator</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/ACHDebitAgreementIndicator"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- Begin separated repeating Data table -->
          <xsl:if test="$Print = $Separated and count($FormData/AffiliatedGroupInfo) &gt; 6">
            <span class="styRepeatingDataTitle">Form 7004, Line 2 - Members of an affiliated group of corporations filing a consolidated return (consolidated group):</span>
            <table class="styDepTbl" style="font-size:7pt;" cellspacing="0">
              <thead class="styTableThead" style="border-color:black">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" style="font-weight:bold;width:142mm;height:4mm">Name and address of each member of the affiliated group</th>
                  <th class="styDepTblCell" style="font-weight:bold;width:45mm;height:4mm;border-right-width: 0px">Employer identification number</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody style="border-color:black; vertical-align:bottom;border-bottom-width:0px;">
                <xsl:for-each select="$FormData/AffiliatedGroupInfo">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="text-align: left; width:142mm;height:8mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="AffiliatedGroupName/BusinessNameLine1"/>
                      </xsl:call-template>
                      <xsl:if test="normalize-space(AffiliatedGroupName/BusinessNameLine2)!=''">
                        <br/>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="AffiliatedGroupName/BusinessNameLine2"/>
                        </xsl:call-template>
                      </xsl:if>
                      <br/>
                      <xsl:choose>
                        <xsl:when test="AffiliatedGroupUSAddress">
                          <xsl:call-template name="PopulateUSAddressTemplate">
                            <xsl:with-param name="TargetNode" select="AffiliatedGroupUSAddress"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="PopulateForeignAddressTemplate">
                            <xsl:with-param name="TargetNode" select="AffiliatedGroupFrgnAddress"/>
                          </xsl:call-template>
                        </xsl:otherwise>
                      </xsl:choose>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styDepTblCell" style="text-align: center; width:45mm;">
                      <xsl:choose>
                        <xsl:when test="AffiliatedGroupEIN">
                          <xsl:call-template name="PopulateEIN">
                            <xsl:with-param name="TargetNode" select="AffiliatedGroupEIN"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                          <div style="text-align:left">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AffiliatedGroupNoEINReason"/>
                            </xsl:call-template>
                          </div>
                        </xsl:otherwise>
                      </xsl:choose>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="AddRows7004">
    <xsl:param name="NumOfRows"/>
    <xsl:param name="StockCount"/>
    <xsl:param name="IsSeparated">no</xsl:param>
    <xsl:if test="$StockCount &lt; $NumOfRows">
      <tr>
        <td class="styTableCell" style="height:8mm">
          <span class="styTableCellPad"/>
        </td>
        <td class="styTableCell" style="height:8mm;border-right-width: 0px">
          <span class="styTableCellPad"/>
        </td>
      </tr>
      <xsl:call-template name="AddRows7004">
        <xsl:with-param name="StockCount" select="$StockCount + 1"/>
        <xsl:with-param name="NumOfRows" select="$NumOfRows"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
