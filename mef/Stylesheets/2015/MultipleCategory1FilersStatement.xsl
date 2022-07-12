<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/MultipleCategory1FilersStmt" />
  <xsl:template name="DependencyTemplate">
  
  <xsl:for-each select="$DependencyData/Cat1FilerNotFilingSingle8865">  
    <table id="MC1FTbl" class="styDepTbl">
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row"  style="width:40%;text-align:right;">Item No.                          </th>
        <td class="styDepTblCell" style="text-align:center;" ><xsl:value-of select="position()" /></td>
      </tr>      
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's Name
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="Category1FilerName/BusinessNameLine1Txt" />
          </xsl:call-template>
          <xsl:if test="Category1FilerName/BusinessNameLine2Txt != ''">
            <br /><xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="Category1FilerName/BusinessNameLine2Txt" />
              </xsl:call-template>
          </xsl:if>          
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's EIN
        </th>
        <td class="styDepTblCell" style="text-align:left;">
           <xsl:choose>
               <xsl:when test="normalize-space(Category1FilerEIN)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="Category1FilerEIN"/>
                       </xsl:call-template>  
                       <span style="width: 2px"></span>
               </xsl:when>  
              <xsl:otherwise> 
	            	<xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="MissingEINReason"/>
		            </xsl:call-template>    
		           <span style="width: 2px"></span>
	          </xsl:otherwise>   
          </xsl:choose>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's Tax Year Beginning  
        </th>
        <td class="styDepTblCell" style="text-align:center;">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="Category1FilerTaxYearBeginning" />
          </xsl:call-template>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's Tax Year Ending
        </th>
        <td class="styDepTblCell" style="text-align:center;">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="Category1FilerTaxYearEnding" />
          </xsl:call-template>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's Share of Liabilities - Nonrecourse
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
  <!--        <span style="width:44mm;text-align:right;">  -->
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="Cat1FilerShrOfLiabNonrecourse" />        
          </xsl:call-template>
<!--          </span>   -->
        </td>
      </tr>    
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's Share of Liabilities - Qualified Nonrecourse Financing
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
  <!--        <span style="width:44mm;text-align:right;">  -->
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="QualifiedNonrecourseFinancing" />
            </xsl:call-template>
<!--          </span>   -->
        </td>
      </tr>    
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's Share of Liabilities - Other
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
  <!--        <span style="width:44mm;text-align:right;">  -->
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="Cat1FilerShrOfLiabilitiesOther" />
            </xsl:call-template>
<!--          </span>   -->
        </td>
      </tr>    
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Parent Category 1 Filer's Name
        </th>
        <td class="styDepTblCell" style="text-align:left;" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ParentCategory1FilerName/BusinessNameLine1Txt" />
          </xsl:call-template>
          <xsl:if test="ParentCategory1FilerName/BusinessNameLine2Txt != ''">
            <br /><xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ParentCategory1FilerName/BusinessNameLine2Txt" />
              </xsl:call-template>
          </xsl:if>            
        </td>
      </tr>    
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Parent Category 1 Filer's EIN
        </th>
        <td class="styDepTblCell" style="text-align:left;" >
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="ParentCategory1FilerEIN" />
          </xsl:call-template>
        </td>
      </tr>    
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Parent Category 1 Filer's Address          
        </th>
        <td class="styDepTblCell" style="text-align:left;" >
   <xsl:choose>
        <xsl:when test="ParentCat1FilerUSAddress">
             <xsl:call-template name="PopulateUSAddressTemplate">
                    <xsl:with-param name="TargetNode" select="ParentCat1FilerUSAddress" />
             </xsl:call-template> 
       </xsl:when>
  <xsl:otherwise>
       <xsl:call-template name="PopulateForeignAddressTemplate">
               <xsl:with-param name="TargetNode" select="ParentCat1FilerForeignAddress" />
       </xsl:call-template> 
    </xsl:otherwise>
 </xsl:choose>
        </td>
      </tr>  
    <xsl:if test="IRS8865ScheduleA">
      <tr  class="styDepTblRow1">
        <th class="styDepTblHdr" scope="row" style="text-align:center;" colspan="2">
          IRS8865 Schedule A
        </th>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Owns Direct Interest
        <!--
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="IRS8865ScheduleA/OwnsDirectInterest" />
          </xsl:call-template>  
          Owns Direct Interest
        </label>
        -->  
        </th>
        <td class="styDepTblCell" style="text-align:left;" >
          <xsl:choose>
            <xsl:when test="IRS8865ScheduleA/OwnsDirectInterest = 'X'">
              Yes
            </xsl:when>
            <xsl:otherwise>No</xsl:otherwise>
          </xsl:choose>
          <!--
          <input type="checkbox" class="styCkbox">              
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleA/OwnsDirectInterest" />
            </xsl:call-template>
          </input>
          -->
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Owns Constructive Interest  
          <!--
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleA/OwnsConstructiveInterest" />
            </xsl:call-template>  
            Owns Constructive Interest  
          </label>
          -->
        </th>
        <td class="styDepTblCell" style="text-align:left;" >
          <xsl:choose>
            <xsl:when test="IRS8865ScheduleA/OwnsConstructiveInterest = 'X'">
              Yes
            </xsl:when>
            <xsl:otherwise>No</xsl:otherwise>
          </xsl:choose>
          <!--
          <input type="checkbox" class="styCkbox">              
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleA/OwnsConstructiveInterest" />
            </xsl:call-template>
          </input>
          -->
        </td>
      </tr>
      <xsl:if test="IRS8865ScheduleA/ConstructiveOwnershipInfo">
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:15mm;" colspan="2">
            Constructive Ownership of Partnership Interest
            <span class="styDepTableCellPad"></span>
          </th>
        </tr>
      </xsl:if>
    <xsl:for-each select="IRS8865ScheduleA/ConstructiveOwnershipInfo" >
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Constructive Owner Name    
        </th>
        <td class="styDepTblCell" style="text-align:left;" >
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ConstructiveOwnerName/BusinessNameLine1Txt" />
          </xsl:call-template>
          
          <xsl:if test="ConstructiveOwnerName/BusinessNameLine2Txt">
            <br/><xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ConstructiveOwnerName/BusinessNameLine2Txt" />
              </xsl:call-template>
          </xsl:if>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
            Constructive Owner's U.S. or Foreign Address  
        </th>
        <td class="styDepTblCell" style="text-align:left;" >
          <xsl:choose>
            <xsl:when test="ConstructiveOwnerUSAddress" >      
           <xsl:call-template name="PopulateUSAddressTemplate">
                <xsl:with-param name="TargetNode" select="ConstructiveOwnerUSAddress" />
              </xsl:call-template>
           </xsl:when>
           <xsl:otherwise>
 
    
           <xsl:call-template name="PopulateForeignAddressTemplate">
                <xsl:with-param name="TargetNode" select="ConstructiveOwnerFrgnAddress" />
              </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
        </td>
      </tr>

      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
            Constructive Owner's TIN
        </th>
        <td class="styDepTblCell" style="text-align:left;" >
          <xsl:choose>
            <xsl:when test="ConstructiveOwnerSSN" >
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="ConstructiveOwnerSSN" />
              </xsl:call-template>
            </xsl:when>

          <xsl:when test="MissingEINReason">
                <xsl:call-template name="PopulateText">
              	  <xsl:with-param name="TargetNode" select="MissingEINReason" />
                </xsl:call-template>
              </xsl:when>
          
            <xsl:otherwise>
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="ConstructiveOwnerEIN" />
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
            Check if Foreign Person  
        </th>
        <td class="styDepTblCell" style="text-align:left;" >
          <xsl:choose>
            <xsl:when test="ConstructiveOwnerIsFrgnPerson = 'X'">
              Yes
            </xsl:when>
            <xsl:otherwise>No</xsl:otherwise>
          </xsl:choose>
        <!--
          <input type="checkbox" class="styCkbox">              
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode"  select="ConstructiveOwnerIsFrgnPerson" />
            </xsl:call-template>
          </input>
          -->
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
            Check if Direct Partner
          <!--
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="ConstructiveOwnerIsDirectPrtnr" />
            </xsl:call-template>  
            Check if Direct Partner
          </label>
          -->
        </th>
        <td class="styDepTblCell" style="text-align:left;" >
          <xsl:choose>
            <xsl:when test="ConstructiveOwnerIsDirectPrtnr = 'X'">
              Yes
            </xsl:when>
            <xsl:otherwise>No</xsl:otherwise>
          </xsl:choose>
          <!--
          <input type="checkbox" class="styCkbox">              
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="ConstructiveOwnerIsDirectPrtnr" />
            </xsl:call-template>
          </input>
          -->
        </td>
      </tr>
    </xsl:for-each>
    
  </xsl:if>
    <xsl:if test="IRS8865ScheduleN">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblHdr" scope="row" style="text-align:center;" colspan="2">
          IRS8865 Schedule N      
        </th>
      </tr>
      <!-- Repeat block -->
      <xsl:if test="IRS8865ScheduleN/IRS8865SchN/SalesOfInventory">
        <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">       
            Sales of inventory  
          </th>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            U.S. Person Filing this Return            
          </th>
          <td class="styDepTblCell" style="text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfInventory/USPerson" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfInventory/DomesticCorpOrPartnership" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfInventory/ForeignCorpOrPartnership" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                      <!--span class="styDepTableCellPad"></span-->
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfInventory/USPerson10PctOrMoreDirectInt" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="IRS8865ScheduleN/IRS8865SchN/SalesOfProperty">
        <tr class="styDepTblRow1" style="text-align:right;">
          <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
            Sales of Property
          </th>
        </tr>
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            U.S. Person Filing this Return            
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfProperty/USPerson" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfProperty/DomesticCorpOrPartnership" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfProperty/ForeignCorpOrPartnership" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                      <!--span class="styDepTableCellPad"></span-->
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfProperty/USPerson10PctOrMoreDirectInt" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="IRS8865ScheduleN/IRS8865SchN/CompensationReceived">
        <tr class="styDepTblRow2" style="text-align:right;">
          <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
            Compensation Received for Technical, Managerial, Engineering, Construction, or like Services                  </th>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            U.S. Person Filing this Return            
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompensationReceived/USPerson" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode"                 select="IRS8865ScheduleN/IRS8865SchN/CompensationReceived/DomesticCorpOrPartnership" />
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr  class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          </th>
          <td class="styDepTblCell" style="text-align:right;" >
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode"   select="IRS8865ScheduleN/IRS8865SchN/CompensationReceived/ForeignCorpOrPartnership" />
              </xsl:call-template>
            </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompensationReceived/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/CommissionsReceived">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Commissions Received    
        </th>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsReceived/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsReceived/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsReceived/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsReceived/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/RentsRoyaltiesLicenseFeesRcvd">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Rents, Royalties, and License Fees Received
        </th>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentsRoyaltiesLicenseFeesRcvd/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentsRoyaltiesLicenseFeesRcvd/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentsRoyaltiesLicenseFeesRcvd/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentsRoyaltiesLicenseFeesRcvd/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
  </xsl:if>  
  <xsl:if test="IRS8865ScheduleN/IRS8865SchN/DistributionsReceived">  
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Distributions Received  
        </th>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistributionsReceived/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistributionsReceived/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistributionsReceived/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistributionsReceived/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/InterestReceived">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Interest Received
        </th>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/InterestReceived/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/InterestReceived/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/InterestReceived/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/InterestReceived/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>  
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/OtherReceived">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Other Received  
        </th>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherReceived/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherReceived/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherReceived/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherReceived/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/AllReceivedTotal">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          All Received Total
        </th>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllReceivedTotal/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllReceivedTotal/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllReceivedTotal/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllReceivedTotal/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/PurchasesOfInventory">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Purchases of Inventory  
        </th>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PurchasesOfInventory/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PurchasesOfInventory/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PurchasesOfInventory/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PurchasesOfInventory/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/PurchasesOfTangibleProperty">    
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Purchases of Tangible Property
        </th>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PurchasesOfTangibleProperty/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
      <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PurchasesOfTangibleProperty/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PurchasesOfTangibleProperty/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PurchasesOfTangibleProperty/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/PurchasesOfPropertyRights">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Purchases of Property Rights (patents, trademarks, etc.)  
        </th>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PurchasesOfPropertyRights/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PurchasesOfPropertyRights/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PurchasesOfPropertyRights/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PurchasesOfPropertyRights/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/CompensationPaid">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Compensation Paid for Technical, Managerial, Engineering, Construction, or like Services  
        </th>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompensationPaid/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompensationPaid/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompensationPaid/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompensationPaid/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/CommissionsPaid">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Commissions Paid
        </th>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsPaid/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsPaid/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsPaid/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsPaid/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/RentsRoyaltiesLicenseFeesPaid">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Rents, Royalties, and License Fees Paid    
        </th>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentsRoyaltiesLicenseFeesPaid/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentsRoyaltiesLicenseFeesPaid/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentsRoyaltiesLicenseFeesPaid/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentsRoyaltiesLicenseFeesPaid/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/DistributionsPaid">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Distributions Paid
        </th>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistributionsPaid/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistributionsPaid/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistributionsPaid/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistributionsPaid/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/InterestPaid">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Interest Paid
        </th>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/InterestPaid/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/InterestPaid/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/InterestPaid/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/InterestPaid/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/OtherPaid">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Other Paid
        </th>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherPaid/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherPaid/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherPaid/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherPaid/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/AllPaidTotal">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          All Paid Total
        </th>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllPaidTotal/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          <span class="styDepTableCellPad"></span>
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllPaidTotal/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllPaidTotal/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllPaidTotal/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/AmountsBorrowed">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Amounts Borrowed (enter the maximum loan balance during the year)
        </th>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsBorrowed/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsBorrowed/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsBorrowed/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsBorrowed/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/AmountsLoaned">    
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Amounts loaned (enter the maximum loan balance during the year)  
        </th>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsLoaned/USPerson" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsLoaned/DomesticCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsLoaned/ForeignCorpOrPartnership" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr  class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;" >
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsLoaned/USPerson10PctOrMoreDirectInt" />
            </xsl:call-template>
          </span>
        </td>
      </tr>
      </xsl:if>
    </xsl:if>
  </table>
    <br/>
  </xsl:for-each>
  
  
  
  
  
  
  </xsl:template>
  
  <xsl:template name="GetClass">
    <xsl:attribute name="class">
      <xsl:choose>
         <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
         <xsl:otherwise>styDepTblRow2</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>
  

  
  
  
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/" >

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
         <meta name="Description" content="{$depDocTitle}" />
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>

        
        <style type="text/css">
        </style>
        <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"></xsl:call-template>    
  </xsl:if>
</style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
    
      <body class="styBodyClass">

        <xsl:call-template name="DocumentHeaderDependency"  />  
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:105mm;"><xsl:value-of select="$depDocTitle" /></span>    
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"></span>
        <!-- Transform Itemized Other Income Schedule -->
        <xsl:call-template name="DependencyTemplate" />
        
        <br />
      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







