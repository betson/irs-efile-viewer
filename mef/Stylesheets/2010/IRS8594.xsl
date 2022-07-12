<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8594Style.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<!-- Defines the stage of the data, e.g. original or latest  -->
<xsl:param name="Form8594Data" select="$RtnDoc/IRS8594" />
<xsl:template match="/">
<html>
  <head>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8594Data)"></xsl:with-param></xsl:call-template></title>
    <!-- No Browser Caching  -->
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private" />
    <!-- Define Character Set -->
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="Description" content="IRS Form 8594" />      
    <xsl:call-template name="InitJS"></xsl:call-template>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
    <style type="text/css">
      <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS8594Style"></xsl:call-template>  
        <xsl:call-template name="AddOnStyle"></xsl:call-template>   
      </xsl:if>
    </style>  
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
  <body class="styBodyClass">
    <form name="Form8594">
         <xsl:call-template name="DocumentHeader"  />  
      <!-- Begin Form Number and Name -->
      <div class="styTBB" style="width:187mm;height:18mm;">
        <div class="styFNBox" style="width:35mm;height:18mm;">
          <div style="height:10mm;">
            Form<span class="styFormNumber">  8594</span><br/>
            (Rev. February 2006)
           </div>
          <div  style="height:7mm;font-size:7pt;font-family:arial;" >
            <span class="styAgency">Department of the Treasury</span>            
            <xsl:call-template name="SetFormLinkInline">
 <xsl:with-param name="TargetNode" select="$Form8594Data"/>
 </xsl:call-template>            
            <br/>
            <span class="styAgency">Internal Revenue Service</span>
          </div>        
        </div>    
        <div class="styFTBox" style="width:121mm;height:18mm;">
          <div class="styMainTitle" >Asset Acquisition Statement </div>
          <div class="styMainTitle" style="font-size:11pt;">Under Section 1060 </div>
          <div class="styFBT" style="padding-top:2mm;">
            <img src="{$ImagePath}/8594_Bullet.gif" alt="bullet image"/> 
            Attach to your income tax return.
            <span style="width:8px;"></span>
            <img src="{$ImagePath}/8594_Bullet.gif" alt="bullet image"/> 
            See separate instructions.
          </div>
        </div>      
        <div class="styTYBox" style="width:30mm;height:18mm;">
          <div class="styOMB" style="height:9mm;padding-top:2mm;padding-left:.3mm;">OMB No. 1545-1021</div>
          <div style="height:12mm;text-align:left;padding-left:1mm;border-bottom-width:0px;padding-top:1.5mm;" class="styOMB">
 Attachment 
         <br />Sequence No. 
         <span class="styBoldText">61</span>
        </div>
        </div>
      </div>
          <div class="styBB" style="width:187mm;">
        <div class="styNameBox" style="width:120mm;height:8mm;font-size:7pt; padding-left:5mm;">
          Name as shown on return<br/>
           <xsl:call-template name="PopulateText">
               <xsl:with-param name="TargetNode" select="$Form8594Data/BusinessName/BusinessNameLine1">
               </xsl:with-param>
          </xsl:call-template><br/>  
      <xsl:call-template name="PopulateText">
           <xsl:with-param name="TargetNode" select="$Form8594Data/BusinessName/BusinessNameLine2">
           </xsl:with-param>
      </xsl:call-template>
 </div>
          
        <div style="width:65mm;height:8mm;float:left;padding-left:2mm;font-size:7pt;">
          <span style="width:4px;"></span>
          Identifying number as shown on return
          <br/><br/>
          	<span style="font-weight:normal;padding-left:1.5mm;">  
      		         <xsl:call-template name="PopulateEIN">
    				<xsl:with-param name="TargetNode" select="$Form8594Data/EIN"/>
    			   </xsl:call-template>
    			   <xsl:if test="$Form8594Data/BusinessMissingEINReason!=' '">            
                           <span style="font-weight:normal;">  
                               <xsl:call-template name="PopulateText">
                                  <xsl:with-param name="TargetNode" select="$Form8594Data/BusinessMissingEINReason"/>
                               </xsl:call-template>
                          </span> 
                      </xsl:if>
         </span>   
        </div>
      </div>
        <div class="styBB" style="width:187mm;">
       <div style="width:182mm;padding-left:5mm;">
          Check the box that identifies you:            
          <br/>    
           <input type="checkbox" class="styCkbox">
             <xsl:call-template name="PopulateCheckbox">
                 <xsl:with-param name="TargetNode" select="$Form8594Data/Purchaser" />
             <xsl:with-param name="BackupName">IRS8594Buyer</xsl:with-param>
             </xsl:call-template>
           </input>           
          <label>
            <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form8594Data/Purchaser" />
            <xsl:with-param name="BackupName">IRS8594Purchaser</xsl:with-param>
            </xsl:call-template>
            Purchaser
          </label>
          <span style="width:24px"></span>          
          <input type="checkbox" class="styCkbox">
             <xsl:call-template name="PopulateCheckbox">
                   <xsl:with-param name="TargetNode" select="$Form8594Data/Seller" />
                   <xsl:with-param name="BackupName">IRS8594Seller</xsl:with-param>
            </xsl:call-template>
           </input>
          <label>
            <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$Form8594Data/Seller" />
                <xsl:with-param name="BackupName">IRS8594Seller</xsl:with-param>
            </xsl:call-template>
            Seller
          </label>
        </div>
      </div>        
      <!-- End Form Number and Name section -->            
      <!-- BEGIN Part I Title -->
      <div class="styBB" style="width:187mm;">
        <div class="styPartName">Part I </div>
        <div class="styPartDesc">General Information </div>
      </div>
      <!-- END Part I  Title -->            
      <div class="styBB" style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;">1</div>
        <div class="styNameBox" style="width:112mm;height:9.5mm;font-size:7pt;">
          Name of other party to the transaction<br />                    
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8594Data/NameOfOtherParty/BusinessNameLine1" />
          </xsl:call-template>
          <xsl:if test="$Form8594Data/NameOfOtherParty/BusinessNameLine2 !=''">
            <br/><xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form8594Data/NameOfOtherParty/BusinessNameLine2" />
            </xsl:call-template>
          </xsl:if>
        </div>
        <div style="width:63mm;padding-left:3mm;float:left;">
          Other party's identifying number <br /><br />             
           <xsl:choose>
                   <xsl:when test="normalize-space($Form8594Data/EINOfOtherParty)">
                   	<span style="text-align:center;width:40mm;padding-top:.1mm;vertical-align:bottom">  
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="$Form8594Data/EINOfOtherParty"/>
                       </xsl:call-template>
                       </span>  
                       <span style="width: 2px"></span>
               </xsl:when> 
               <xsl:when test="normalize-space($Form8594Data/SSNOfOtherParty)">
               <span style="text-align:center;width:40mm;">
                     <xsl:call-template name="PopulateSSN">
                             <xsl:with-param name="TargetNode" select="$Form8594Data/SSNOfOtherParty"/>
                    </xsl:call-template></span>  
                    <span style="width: 2px"></span>
               </xsl:when> 
              <xsl:otherwise> 
	            	<xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="$Form8594Data/MissingEINReason"/>
		            </xsl:call-template>    
		           <span style="width: 2px"></span>
	          </xsl:otherwise>   
          </xsl:choose>
         </div>
      </div>      
      <div class="styBB" style="width:187mm;">        
        <div class="styNumberBox" style="height:8mm;font-size:7pt;padding-left:8mm;">
          Address (number, street, and room or suite no.)
          <br/>          
            <xsl:if test="$Form8594Data/USAddressOfOtherParty">
            <xsl:if test="$Form8594Data/USAddressOfOtherParty/AddressLine1!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/USAddressOfOtherParty/AddressLine1"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form8594Data/USAddressOfOrganization/AddressLine2!=''">
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/USAddressOfOtherParty/AddressLine2"/>
              </xsl:call-template>
            </xsl:if>
             </xsl:if>             
             <xsl:if test="$Form8594Data/ForeignAddressOfOtherParty">
            <xsl:if test="$Form8594Data/ForeignAddressOfOtherParty/AddressLine1!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/ForeignAddressOfOtherParty/AddressLine1"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form8594Data/ForeignAddressOfOtherParty/AddressLine2!=''">
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/ForeignAddressOfOtherParty/AddressLine2"/>
              </xsl:call-template>
            </xsl:if>
             </xsl:if>
        </div>
      </div>        
      <div class="styBB" style="width:187mm;">        
        <div class="styNumberBox" style="height:8mm;font-size:7pt;padding-left:8mm;">
          City or town,
          <span style="width:1px;"></span>
          state,
          <span style="width:1px;"></span>
          and
          <span style="width:1px;"></span>
          ZIP code<br/>          
            <xsl:if test="$Form8594Data/USAddressOfOtherParty">
            <xsl:if test="$Form8594Data/USAddressOfOtherParty/City!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/USAddressOfOtherParty/City"/>
              </xsl:call-template>,
            </xsl:if>
            <xsl:if test="$Form8594Data/USAddressOfOtherParty/State!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/USAddressOfOtherParty/State"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form8594Data/USAddressOfOtherParty/ZIPCode!=''">
              <span style="width:1mm;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/USAddressOfOtherParty/ZIPCode"/>
              </xsl:call-template>
            </xsl:if>
             </xsl:if>             
              <xsl:if test="$Form8594Data/ForeignAddressOfOtherParty">
              <xsl:if test="$Form8594Data/ForeignAddressOfOtherParty/City!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/ForeignAddressOfOtherParty/City"/>
              </xsl:call-template>,
            </xsl:if>
            <xsl:if test="$Form8594Data/ForeignAddressOfOtherParty/ProvinceOrState!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/ForeignAddressOfOtherParty/ProvinceOrState"/>
              </xsl:call-template><br />
            </xsl:if>
              <xsl:if test="$Form8594Data/ForeignAddressOfOtherParty/Country!=''">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/ForeignAddressOfOtherParty/Country"/>
              </xsl:call-template>
            </xsl:if>     
            <xsl:if test="$Form8594Data/ForeignAddressOfOtherParty/PostalCode!=''">
              <span style="width:1mm;"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8594Data/ForeignAddressOfOtherParty/PostalCode"/>
              </xsl:call-template>
            </xsl:if>          
           </xsl:if>  
         </div>
      </div>      
      <div class="styBB" style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;">2</div>
        <div class="styNameBox" style="width:100mm;height:8mm;font-size:7pt;">
          Date of sale 
          <br/><br/><span style="text-align:center;width:100mm;">                       
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="$Form8594Data/DateOfSale" />
          </xsl:call-template>
          </span>           
        </div>
        <div style="width:78mm;height:8mm;padding-left:3mm;float:left;">
          <div class="styLNLeftNumBox" style="height:4.5mm;padding-top:0mm;">3</div>
          Total sales price (consideration) <br/><br/>          
          <span style="width:30mm;text-align:right;float:right;">
            <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form8594Data/TotalSalesPrice" />
            </xsl:call-template>
          </span>
        </div>
      </div>     
      <!-- BEGIN Part II Title -->
      <div class="styBB" style="width:187mm;">
        <div class="styPartName">Part II </div>
        <div class="styPartDesc">Original Statement of Assets Transferred
        </div>
      </div>
      <!-- END Part II  Title -->    
      <div class="styIRS8594TableContainer">
        <!-- print logic -->
          <xsl:call-template name="SetInitialState"/>
        <!-- end -->
        <table class="styTable" cellspacing="0" style="font-size:7pt;">
          <thead class="styTableThead">
            <tr>
              <th class="styTableCellHeader" style="width:31mm;text-align:left;font-weight:normal;" scope="col"> <span class="styBoldText" style="width:24px;padding-left:1mm;">4</span>  Assets </th>
              <th class="styTableCellHeader" style="width:80mm;font-weight:normal;" scope="col">Aggregate fair market value (actual amount for Class I)</th>
              <th class="styTableCellHeader" style="width:75mm;border-right-width: 0px;font-weight:normal;" scope="col">Allocation of sales price</th>            
            </tr>
          </thead>
          <tfoot></tfoot>
          <tbody>
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Class I              
              </td>
              <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class1FairMarketValue" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class1SalesPriceAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>                          
            </tr>             
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Class II              
              </td>
              <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class2FairMarketValue" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class2SalesPriceAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>                          
            </tr>             
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Class III              
              </td>
              <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class3FairMarketValue" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class3SalesPriceAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>                          
            </tr>             
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Class IV              
              </td>
              <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class4FairMarketValue" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class4SalesPriceAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>                          
            </tr>            
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Class V              
              </td>
              <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class5FairMarketValue" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class5SalesPriceAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>                          
            </tr>             
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Class VI and VII              
              </td>
              <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class6And7FairMarketValue" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class6And7SalesPriceAllocation" /></xsl:call-template>  
                <span style="width:4px;"></span>        
              </td>                          
            </tr>            
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Total              
              </td>
              <td class="styTableCellText" style="width:80mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/TotalFairMarketValue" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:75mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/TotalSalesPriceAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>                          
            </tr>                  
          </tbody>
        </table>
      </div>      
      <div  style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">5</div>
        <div  class="styLNDesc" style="width:145mm;">
          Did the purchaser and seller provide for an allocation of the sales price in the sales contract or in another          
        </div>
      </div>      
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"></div>
        <div style="float:left;">          
          written document signed by both parties?          
        </div>
        <div style="float:right">    
          <span style="letter-spacing:16px; font-weight:bold; float:left">..................</span>  
         <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
          <span >
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form8594Data/BuyerOrSellerProvAllocnPrice" />
              </xsl:call-template>         
              <input type="checkbox" class="styCkbox" name="Checkbox" > 
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/BuyerOrSellerProvAllocnPrice" />
                </xsl:call-template>
              </input> 
              </span>
              <span style="width:8px"></span>
               <label>
                 <xsl:call-template name="PopulateLabelYes">
                   <xsl:with-param name="TargetNode" select="$Form8594Data/BuyerOrSellerProvAllocnPrice" />
                 </xsl:call-template>Yes 
                 </label>          
            </div>
            <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
            <span >
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form8594Data/BuyerOrSellerProvAllocnPrice" />
              </xsl:call-template>
              <input type="checkbox" class="styCkbox" name="Checkbox" > 
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/BuyerOrSellerProvAllocnPrice" />
                </xsl:call-template>
              </input>
            </span>
              <span style="width:8px"></span>
               <label>
                 <xsl:call-template name="PopulateLabelNo">
                   <xsl:with-param name="TargetNode" select="$Form8594Data/BuyerOrSellerProvAllocnPrice" />
                 </xsl:call-template>No 
                 </label>        
            </div>  
        </div>             
      </div>     
      <div  style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"></div>
        <div  class="styLNDesc" style="width:145mm;">
          If "Yes," are the aggregate fair market values (FMV) listed for each of asset Classes I, II, III, IV, V, VI, and          
        </div>
      </div>     
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"></div>
        <div style="float:left;">          
          VII the amounts agreed upon in your sales contract or in a separate written document?          
        </div>
        <div style="float:right">    
          <span style="letter-spacing:16px; font-weight:bold; float:left">.....</span>  
          <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">   
          <span >
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form8594Data/AggregateValuesListed" />
              </xsl:call-template>       
              <input type="checkbox" class="styCkbox" name="Checkbox" > 
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/AggregateValuesListed" />
                </xsl:call-template>
              </input> 
            </span>
              <span style="width:8px"></span>
               <label>
                 <xsl:call-template name="PopulateLabelYes">
                   <xsl:with-param name="TargetNode" select="$Form8594Data/AggregateValuesListed" />
                 </xsl:call-template>Yes 
                </label>          
            </div>
            <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
             <span >
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form8594Data/AggregateValuesListed" />
              </xsl:call-template>
              <input type="checkbox" class="styCkbox" name="Checkbox" > 
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/AggregateValuesListed" />
                </xsl:call-template>
              </input>
              </span>
              <span style="width:8px"></span>
               <label>
                 <xsl:call-template name="PopulateLabelNo">
                   <xsl:with-param name="TargetNode" select="$Form8594Data/AggregateValuesListed" />
                 </xsl:call-template>No 
                     </label>        
            </div>
        </div>          
      </div>
       <div class="styBB" style="width:187mm;"> </div>  
        <div  style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">6</div>
        <div  class="styLNDesc" style="width:145mm;">
          In the purchase of the group of assets (or stock), did the purchaser also purchase a license or a covenant          
        </div>
      </div>  
      <div  style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"></div>
        <div  class="styLNDesc" style="width:145mm;">
          not to compete, or enter into a lease agreement, employment contract, management contract, or similar          
        </div>
      </div>     
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"></div>
        <div style="float:left;">          
          arrangement with the seller (or managers, directors, owners, or employees of the seller)?
          <span style="width:1px;"></span>
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form8594Data/PurchaseOrEnterAgrmtWithSeller"/>
          </xsl:call-template>                    
        </div>
        <div style="float:right">    
          <span style="letter-spacing:16px; font-weight:bold; float:left"> .....  
          </span>           
        <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">        
          <span >
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form8594Data/PurchaseOrEnterAgrmtWithSeller" />
              </xsl:call-template>    
              <input type="checkbox" class="styCkbox" name="Checkbox" > 
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/PurchaseOrEnterAgrmtWithSeller" />
                </xsl:call-template>
              </input> 
            </span>
              <span style="width:8px"></span>
               <label>
                 <xsl:call-template name="PopulateLabelYes">
                   <xsl:with-param name="TargetNode" select="$Form8594Data/PurchaseOrEnterAgrmtWithSeller" />
                 </xsl:call-template>Yes 
                 </label>          
            </div>
            <div class="styLNDesc" style="width:15mm;height:4.5mm;text-align:right;">
             <span >
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form8594Data/PurchaseOrEnterAgrmtWithSeller" />
              </xsl:call-template>
              <input type="checkbox" class="styCkbox" name="Checkbox" > 
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form8594Data/PurchaseOrEnterAgrmtWithSeller" />
                </xsl:call-template>
              </input>
              </span>
              <span style="width:8px"></span>
               <label>
                 <xsl:call-template name="PopulateLabelNo">
                   <xsl:with-param name="TargetNode" select="$Form8594Data/PurchaseOrEnterAgrmtWithSeller" />
                 </xsl:call-template>No 
                 </label>        
            </div> 
        </div>        
      </div>
      <div  style="width:187mm;"> </div>      
      <div  style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"></div>
        <div  class="styLNDesc" style="width:145mm;">
          If "Yes," attach a schedule that specifies  <span class="styBoldText">(a)</span> the type of agreement and <span class="styBoldText">(b)</span> the maximum amount of  
        </div>
      </div>
      <div class="styBB"  style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;"></div>
        <div  class="styLNDesc" style="width:145mm;">
          consideration (not including interest) paid or to be paid under the agreement. See instructions.  
        </div>
      </div>     
      <!-- Page Break-->
      <!-- Footer-->      
      <div class="pageEnd" style="width:187mm;">  
        <div style="float:left;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span>   
          <span style="width:80px;"></span>                        
          Cat. No. 63768Z 
        </div>          
        <div style="float:right;">
          <span style="width:80px;"></span>  
          Form <span class="styBoldText">8594</span> (Rev. 2-2006)
        </div>    
      </div>      
      <!--Begin Page 2 -->      
      <!-- Header -->        
      <div class="styBB" style="width:187mm;">  
        <div style="float:left;">Form 8594 (Rev. 2-2006) <span style="width:130mm;"></span></div>
        <div style="float:right;">Page <span style="font-weight:bold;font-size:7pt;">2</span></div>  
      </div>      
      <!-- BEGIN Part III Title -->
      <div class="styBB" style="width:187mm;height:8mm;">
        <div class="styPartName">Part III </div>
        <div class="styPartDesc">Supplemental Statement—<span class="styNormalText">Complete only if amending an original statement or previously filed<br/>
          supplemental statement because of an increase or decrease in consideration. See instructions.</span>
        </div>
      </div>
      <!-- END Part III  Title --> 
            <div class="styBB"  style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">7</div>
        <div  class="styLNDesc" style="width:178mm;height:8mm;">
          Tax year and tax return form number with which the original Form 8594 and any supplemental statements were filed.  
          <br/><br/>          
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8594Data/TaxYearOfOrigFormFiled" /></xsl:call-template>    
          <span style="width:16px;"></span>
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8594Data/TaxReturnFormNumber" /></xsl:call-template>        
        </div>
      </div>      
      <div class="styIRS8594TableContainer">
        <!-- print logic -->
          <xsl:call-template name="SetInitialState"/>
        <!-- end -->
        <table class="styTable" cellspacing="0" style="font-size:7pt;">
          <thead class="styTableThead">
            <tr>
              <th class="styTableCellHeader" style="width:31mm;text-align:left;" scope="col"> 
                <span class="styBoldText" style="width:24px;padding-left:1mm;">8</span><span style="font-size:6pt;font-weight:normal;">  Assets </span>
               </th>
              <th class="styTableCellHeader" style="width:60mm;font-size:6pt;font-weight:normal;" scope="col">Allocation of sales price as previously reported</th>
              <th class="styTableCellHeader" style="width:37mm;font-size:6pt;font-weight:normal;" scope="col">Increase or (decrease)</th>  
              <th class="styTableCellHeader" style="width:58mm;border-right-width: 0px;font-size:6pt;font-weight:normal;" scope="col">Redetermined allocation of sales price</th>      
            </tr>
          </thead>
          <tfoot></tfoot>
          <tbody>
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Class I              
              </td>
              <td class="styTableCellText" style="width:60mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class1PrevPriceAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:37mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class1IncreaseDecrease" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class1RedeterminedAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>                          
            </tr>           
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Class II              
              </td>
              <td class="styTableCellText" style="width:60mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class2PrevPriceAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:37mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class2IncreaseDecrease" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class2RedeterminedAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>                        
            </tr>            
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Class III              
              </td>
              <td class="styTableCellText" style="width:60mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class3PrevPriceAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:37mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class3IncreaseDecrease" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class3RedeterminedAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>                          
            </tr>            
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Class IV              
              </td>
              <td class="styTableCellText" style="width:60mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class4PrevPriceAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:37mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class4IncreaseDecrease" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class4RedeterminedAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>                        
            </tr>           
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Class V              
              </td>
              <td class="styTableCellText" style="width:60mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class5PrevPriceAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:37mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class5IncreaseDecrease" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class5RedeterminedAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>                          
            </tr>            
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Class VI and VII              
              </td>
              <td class="styTableCellText" style="width:60mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class6And7PrevPriceAllocation" /></xsl:call-template>  
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:37mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class6And7IncreaseDecrease" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/Class6And7RedeterminedAllocn" /></xsl:call-template>  
                <span style="width:4px;"></span>        
              </td>                          
            </tr>            
            <tr>
              <td class="styTableCellText" scope="row" style="width:31mm;padding-top:5mm;">
                Total              
              </td>
              <td class="styTableCellText" style="width:60mm;padding-top:5mm;text-align:right;">                
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>                
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/TotalOfPreviousPriceAllocation" /></xsl:call-template>    
                <span style="width:4px;"></span>        
              </td>
              <td class="styTableCellText" style="width:37mm;background-color:lightgrey;">                    
                <span style="width:1px;"></span>        
              </td>
              <td class="styTableCellText" style="width:58mm;padding-top:5mm;text-align:right;border-right-width: 0px;">              
                <span style="width:4px; float:left;">$</span>
                <span style="width:2px;"></span>
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8594Data/RedeterminedAllocationTotal" /></xsl:call-template>  
                <span style="width:4px;"></span>        
              </td>                          
            </tr>                  
          </tbody>
        </table>
      </div>        
      <div class="styBB"  style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">9</div>
        <div  class="styLNDesc" style="width:178mm;height:8mm;">
          Reason(s) for increase or decrease. Attach additional sheets if more space is needed.
          <span style="width:1px;"></span>
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$Form8594Data/ReasonsForIncreaseOrDecrease"/>
          </xsl:call-template>
          <xsl:if test="count($Form8594Data/ReasonsForIncreaseOrDecrease) !=0 and ($Form8594Data/ReasonsForIncreaseOrDecrease !='')">    
            <br/><br/>          
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8594Data/ReasonsForIncreaseOrDecrease" /></xsl:call-template>  
          </xsl:if>      
        </div>
        <!--Empty rows-->
        <xsl:if test="not($Form8594Data/ReasonsForIncreaseOrDecrease)  or $Form8594Data/ReasonsForIncreaseOrDecrease=''">
          <div class="styGenericDiv" >
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <div class="styBB" style="width:187mm;height:5mm; text-decoration:underline;"><br/><br/></div>
                    <br/><br/>
              </div>  
        </xsl:if>
      </div>    
      <!-- Footer -->
      <div style="width:187mm;">    
        <div class="stySmallText" style="width:130mm;text-align:center;padding-top:1mm;"><span style="width:156px"></span></div>
        <div style="width:46mm;text-align:right;float:right;">Form <span class="styBoldText" style="font-size:8pt;">8594</span> (Rev. 2-2006)</div>
      </div>            
      <br class="pageEnd"/>
      <!-- BEGIN Left Over Table -->  
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        <!-- Additional Data Table -->
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$Form8594Data" />
          </xsl:call-template>
        </table>
      <!-- END Left Over Table -->            
      </form>
    </body>
  </html>
</xsl:template>
</xsl:stylesheet>