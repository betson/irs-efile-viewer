<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 11/15/2013 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8308Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form8308Data" select="$RtnDoc/IRS8308"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8308Data)"/>
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
        <meta name="Description" content="IRS Form 8308"/>
        <xsl:call-template name="InitJS"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8308Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form8308">
          <xsl:call-template name="DocumentHeader"/>
          
          <!-- Begin Form Number and Name -->
          <div class="styTBB" style="width:187mm;height:20mm;">
            <div class="styFNBox" style="width:30mm;height:22mm;">
              <div style="height:7mm;">
                Form<span class="styFormNumber">  8308</span>
              </div>
             <div style="height:7mm;font-size:7pt;font-family:arial;">(Rev. October 2005)
       	 		 	<span style="width:3px;"/>
      	       		<span style="width:3px;"/>
				<xsl:call-template name="LinkToLeftoverDataTableInline">
				<xsl:with-param name="Desc">Form 8308, Top Left Margin - Summary Dormant FDE Indicator</xsl:with-param>
				<xsl:with-param name="TargetNode" select="$Form8308Data/@summaryDormantFDEIndicator"/>
				</xsl:call-template>	                
	      		           <br/><br/>
			                <span class="styAgency">Department of the Treasury</span>
			                <br/>
			                <span class="styAgency">Internal Revenue Service</span>
	   </div>
         </div>
         <div class="styFTBox" style="width:126mm;height:20mm;">
             <div class="styMainTitle">Report of a Sale or Exchange of<br/>Certain Partnership Interests</div>
             	<div class="styFBT">
							<br/> <img src="{$ImagePath}/8308_Bullet_Sm.gif" alt="Bullet"/>
            		Please print or type.           
	            </div>
              </div>
           <div class="styTYBox" style="width:30mm;height:22mm;padding-top:9mm;text-align:left;padding-left:.5mm;">OMB No. 1545-0941</div>
         </div>
         <!-- End Form Header -->
          
          
         <!-- Begin Partner Info -->
         <div class="styBB" style="width:187mm;">
	         <div class="styNameBox" style="width:110mm;height:7mm;font-size:7pt;">Name of partnership<br/>
		           <div style="font-family:verdana;font-size:7pt;height:6.25mm;height:7mm;">
			             <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>  
			             <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template> 
		           </div> 
           </div>
           <div class="styNameBox" style="width:30mm;font-size:7pt;border-right:0px solid black;">
	              <span style="padding-left:1mm;">Telephone number</span><br/><br/>
						  <span style="padding-left:1mm;"> 
	                    <xsl:call-template name="PopulatePhoneNumber">
		                  <xsl:with-param name="TargetNode" select="$Form8308Data/PhoneNumber"/>
		              </xsl:call-template>    
		       </span>
	        </div>
      	   <div style="height: 10mm;padding-left:2mm;font-size:7pt; font-weight: normal;border-left:1px solid black;" class="styEINBox">         
       		   <span class="styBoldText" style="">Employer identification number</span>   
	          <div>    
	             <span style="font-weight:normal;padding-top:3mm;">  
      	        <br/>
      	        <xsl:call-template name="PopulateReturnHeaderFiler">
      	        	<xsl:with-param name="TargetNode">EIN</xsl:with-param>
      	        </xsl:call-template>
            	</span>       
            	</div> 
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:8mm;font-size:7pt;">Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
		        <span style="">
			          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine1</xsl:with-param></xsl:call-template><br/>
			          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine2</xsl:with-param></xsl:call-template>
		        </span>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:8mm;font-size:7pt;">City or town, state, and ZIP code<br/>
		        <span style="width:90mm;">
			          <xsl:call-template name="PopulateReturnHeaderFiler">
			          	<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
			          </xsl:call-template>
			          <br/>
	        		  <xsl:call-template name="PopulateReturnHeaderFiler">
		        		  <xsl:with-param name="TargetNode">Country</xsl:with-param>
	        		  	<xsl:with-param name="MainForm">true</xsl:with-param>
	        		  </xsl:call-template>
    	        	</span>
            </div>
          </div>

          <!-- End Filer Info -->
             


          
          <!-- Part 1, Transferor Information -->
          <div class="styBB" style="width:187mm;float:none;clear:both;">
            <span class="styPartName" style="width: 12mm;">Part I</span>
            <span class="styPartDesc" style="">Transferor Information<span class="styNormalText"> (Beneficial owner of the partnership interest immediately before the transfer of that interest)</span></span>
          </div>
          
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:155mm;height:7mm;font-size:7pt;">
              Name<br/>
                   <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode"
                     select="$Form8308Data/TransferorName/BusinessNameLine1"/>
                  </xsl:call-template>
                  <xsl:if test="$Form8308Data/TransferorName/BusinessNameLine2">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode"
                       select="$Form8308Data/TransferorName/BusinessNameLine2"/>
                    </xsl:call-template>
                  </xsl:if>
          </div>

          <div style="height: 7mm;padding-left:2mm;font-size:7pt; font-weight: normal;"
             class="styEINBox">       
			<span class="styBoldText">Identifying number</span><br/><br/>   
                <xsl:choose>
					<xsl:when test="$Form8308Data/TransferorEIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$Form8308Data/TransferorEIN"/>
		                </xsl:call-template>
                   </xsl:when> 
                   <xsl:when test="$Form8308Data/TransferorSSN">                
                        <xsl:call-template name="PopulateSSN">
		                  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorSSN"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" 
							select="$Form8308Data/TransferorMissingEINReasonCd"/>
								</xsl:call-template>
					</xsl:otherwise>
                </xsl:choose>
          </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:8mm;font-size:7pt;">
              Number and street (including apt. no.)
				<br/>
				<xsl:if test="$Form8308Data/TransferorUSAddress ">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode"
						 select="$Form8308Data/TransferorUSAddress/AddressLine1"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/TransferorUSAddress/AddressLine2">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							 select="$Form8308Data/TransferorUSAddress/AddressLine2"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
                <xsl:if test="$Form8308Data/TransferorForeignAddress ">
					<xsl:call-template name="PopulateText">
					   <xsl:with-param name="TargetNode"
					    select="$Form8308Data/TransferorForeignAddress/AddressLine1"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/TransferorForeignAddress/AddressLine2">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							 select="$Form8308Data/TransferorForeignAddress/AddressLine2"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:8mm;font-size:7pt;">
         	 City or town, state, and ZIP code
              <br/>
              <xsl:if test="$Form8308Data/TransferorUSAddress ">
                <xsl:call-template name="PopulateCityStateInfo">
                  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorUSAddress "/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="$Form8308Data/TransferorForeignAddress ">
                <xsl:call-template name="PopulateCityStateInfo">
                  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorForeignAddress "/>
                </xsl:call-template>,
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode"
                   select="$Form8308Data/TransferorForeignAddress/ProvinceOrState "/>
                </xsl:call-template>
                <span style="width:2mm"/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode"
                   select="$Form8308Data/TransferorForeignAddress/Country "/>
                </xsl:call-template>
                <br/>
                 <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode"
                   select="$Form8308Data/TransferorForeignAddress/PostalCode "/>
                </xsl:call-template>
              </xsl:if>
            </div>
          </div>

    <!-- End Part I, Transferor Information -->
    
    <!-- Extra information start -->          
  	<div class="styBB" style="width:187mm;float:none;clear:both;">
		<div class="styLNDesc" style="width:186mm;height:4mm;">
  			<b>Notice to Transferors:</b>
	  		<i>The information on this form has been supplied to the Internal Revenue Service.
	  		 The transferor in a section 751(a) exchange is required to treat a portion of the gain
	  		 realized from the exchange as ordinary income. For more details, see Pub. 541,
	  		 Partnerships.</i>
		</div>          
		<div class="styLNDesc" style="width:186mm;height:4mm;">
			<b>Statement by Transferor:</b>
			<i>The transferor in a section 751(a) exchange is required under Regulations section
			 1.751-1(a)(3) to attach a statement relating to the sale or exchange to his or her return.
			 See Instructions to Transferors for more details.
			</i> 
		</div>
   </div>      
    <!-- Extra information end -->          
           
    <!-- Part II, Transferee Information -->
    <div class="styBB" style="width:187mm;float:none;clear:both;">
		<span class="styPartName" style="width: 12mm;">Part II</span>
		<span class="styPartDesc" style="">Transferee Information
			<span class="styNormalText" style="">
			(Beneficial owner of the partnership interest immediately after the transfer of
			 that interest)</span>
		</span>
    </div>
    <div class="styBB" style="width:187mm;">
		<div class="styNameBox" style="width:155mm;height:7mm;font-size:7pt;">
		  Name<br/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" 
				select="$Form8308Data/TransfereeName/BusinessNameLine1"/>
			</xsl:call-template>
			<xsl:if test="$Form8308Data/TransfereeName/BusinessNameLine2">
				<br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode"
					 select="$Form8308Data/TransfereeName/BusinessNameLine2"/>
				</xsl:call-template>
			</xsl:if>
		</div>
		<div style="height: 7mm;padding-left:2mm;font-size:7pt; font-weight: normal;" 
		  class="styEINBox">         
			<span class="styBoldText">Identifying number</span><br/><br/>
			<xsl:choose>
				<xsl:when test="$Form8308Data/TransfereeEIN">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode"
						 select="$Form8308Data/TransfereeEIN"/>
					</xsl:call-template>
				</xsl:when>                  
				<xsl:when test="$Form8308Data/TransfereeSSN">
					<xsl:call-template name="PopulateSSN">
						<xsl:with-param name="TargetNode" 
						select="$Form8308Data/TransfereeSSN"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" 
						select="$Form8308Data/TransfereeMissingEINReasonCd"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
        </div>
    </div>
    <div class="styBB" style="width:187mm;">
		<div class="styNumberBox" style="height:8mm;font-size:7pt;">
        Number and street (including apt. no.)
			<br/>
			<xsl:if test="$Form8308Data/TransfereeUSAddress">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode"
					 select="$Form8308Data/TransfereeUSAddress/AddressLine1"/>
				</xsl:call-template>
				<xsl:if test="$Form8308Data/TransfereeUSAddress/AddressLine2">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode"
						 select="$Form8308Data/TransfereeUSAddress/AddressLine2"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
			<xsl:if test="$Form8308Data/TransfereeForeignAddress">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" 
					  select="$Form8308Data/TransfereeForeignAddress/AddressLine1"/>
				</xsl:call-template>
				<xsl:if test="$Form8308Data/TransfereeForeignAddress/AddressLine2">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode"
						 select="$Form8308Data/TransfereeForeignAddress/AddressLine2"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
        </div>
    </div>
    <div class="styBB" style="width:187mm;">
        <div class="styNumberBox" style="height:8mm;font-size:7pt;">
       	City or town, state, and ZIP code
            <br/>
            <xsl:if test="$Form8308Data/TransfereeUSAddress ">
                <xsl:call-template name="PopulateCityStateInfo">
					<xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeUSAddress"/>
                </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form8308Data/TransfereeForeignAddress ">
                <xsl:call-template name="PopulateCityStateInfo">
					<xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeForeignAddress "/>
                </xsl:call-template>,
                <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode"
                   select="$Form8308Data/TransfereeForeignAddress/ProvinceOrState "/>
                </xsl:call-template>
                <span style="width:2mm"/>
                <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode"
                   select="$Form8308Data/TransfereeForeignAddress/Country "/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode"
                   select="$Form8308Data/TransfereeForeignAddress/PostalCode "/>
                </xsl:call-template>
            </xsl:if> 
          </div>
    </div>

    <!-- End Part II, Transferee Information -->
          
    <!-- Part III, Date of Sale or Exchange of Partnership Interest -->
    <div class="styBB" style="width:187mm;float:none;clear:both;height:6mm;">
       <span class="styPartName" style="width: 14mm;margin-top:1mm;">Part III</span>
       <span class="styPartDesc" style="width: 92mm;margin-top:1mm;">Date of Sale or Exchange of Partnership Interest
             <img src="{$ImagePath}/8308_Bullet_Md.gif" alt="MidSizeBullet" align="middle"/></span>
	     <span class="styPartDesc" style="font-size:7pt;font-weight:normal;width: 22mm;margin-top:1mm;">

       <xsl:call-template name="PopulateMonthDayYear">
		  <xsl:with-param name="TargetNode" select="$Form8308Data/SaleOrExchangeDt"/>
		  </xsl:call-template>
		  <br/>
			</span>
    </div>
                                          
    <div class="styBB" style="width:187mm;float:none;clear:both;height:6mm;"> 
    <div style="width: 38mm; float:left;border-right: thin solid black;font-size: 7pt;padding-right: 4mm;padding-top: 2mm;padding-bottom: 2mm;"><b>Sign Here Only if You
			Are Filing This Form by
			Itself and Not With Form
			1065 or Form 1065-B</b>
	 </div>

	 <div style="width:145mm;float:right;clear none;font-size: 7pt;">
			Under penalties of perjury, I declare that I have examined this return, including accompanying attachments, and to the best of my
			knowledge and belief, it is true, correct, and complete.<br/><br/>
    <div style="width: 110mm; float: left; clear none;">
      <div style="width: 4mm; float: left; clear: none;"><img src="{$ImagePath}/8308_Bullet_Lg.gif" alt="LargeBullet"/></div>
      <div class="styBB" style="float: left; clear: none; width:90mm; height:4mm; border-style:solid"><span style="width:105mm">
  			
         <xsl:call-template name="PopulateReturnHeaderPartner">
         	<xsl:with-param name="TargetNode">Name</xsl:with-param>
         </xsl:call-template>
 		
      </span>
      
    </div>
    <div style="float: left; clear: none; width:80mm; height:4mm; padding-left:.5mm;font-size: 6pt; text-align:left">Signature of general partner or limited liability company member</div>
    </div>
    
    <div style="width:30mm; float: right;clear none;">
      <div style="width: 4mm; float: left; clear: none;"><img src="{$ImagePath}/8308_Bullet_Lg.gif" alt="LargeBullet"/></div>
      <div class="styBB" style="float: right; clear: none; width:25mm;height:4mm; border-style:solid;"><span style="width:80px">
  			  
         <xsl:call-template name="PopulateReturnHeaderPartner">
         	<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
         </xsl:call-template>
  			  
      </span></div> 
     <div style="float: right; clear: none; width:25mm;height:4mm;padding-left:.5mm;font-size: 6pt; text-align:left;">Date</div>
    </div>

  	 </div>
   </div>
  
    <!-- End Part III, Date of Sale or Exchange of Partnership Interest -->
              
        <div style="width:187mm;">
    
      <span style="width:80mm;"/>       
      Cat. No. 62503I
      <span style="width:45mm;"/>   
      <span style="font-size:7pt;padding-right:1mm;">Form</span> <span class="styBoldText" style="font-size:8pt;">8308</span> <span style="font-size:7pt;padding-left:1mm;">(Rev. 10-2005)</span>
  </div>

        <br/>
        <p style="page-break-before:always"/>           
  

    <!-- BEGIN Left Over Table -->  
    <!-- Additonal Data Title Bar and Button -->
    <div class="styLeftOverTitleLine" id="LeftoverData">
      <div class="styLeftOverTitle">
        Additional Data        
      </div>
      <div class="styLeftOverButtonContainer">
        <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
      </div>      
    </div>
    <!-- Additional Data Table -->
    <table class="styLeftOverTbl">
      <xsl:call-template name="PopulateCommonLeftover">
        <xsl:with-param name="TargetNode" select="$Form8308Data"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>          
    </table>
    <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>