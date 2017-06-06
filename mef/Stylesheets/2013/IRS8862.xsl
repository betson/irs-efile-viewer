<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8862Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8862Data" select="$RtnDoc/IRS8862"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateBox) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="StaticText"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">29mm</xsl:param>
		<xsl:param name="Height">5mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:7pt;
				<xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:2px;</xsl:when><xsl:otherwise>padding-top:4px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:3px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:choose>
				<xsl:when test="$TargetNode">
					<xsl:choose>
						<xsl:when test="$PopulateAsText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="$TargetNode/@referenceDocumentId">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$StaticText">
					<xsl:value-of select="$StaticText"/>
				</xsl:when>
			</xsl:choose>
		</div>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				float:right;
				padding:2px 0px 0px 0px;
				border-right-width:0px;font-size:8pt;
				height:<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	PopulateDayForMonthDayType) -->
	<xsl:template name="PopulateDayForMonthDayType">
		<xsl:param name="TargetNode"/>
		<span>
			<xsl:attribute name="id"><xsl:call-template name="PopulateID"><xsl:with-param name="TargetNode" select="$TargetNode"/></xsl:call-template></xsl:attribute>
			<xsl:call-template name="PopulateChgHistory">
				<xsl:with-param name="targetNode" select="$TargetNode"/>
				<xsl:with-param name="subString" select="'6,2'"/>
			</xsl:call-template>
		</span>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateLine5ChildItem) -->
	<xsl:template name="CreateLine5ChildItem">
		<xsl:param name="Letter"/>
		<xsl:param name="Number"/>
		<xsl:param name="TargetNode"/>
		<!-- (5#LETTER#) ////////////////////////////////////////////////////-->
		<div class="styIRS8862LineItem">
			<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">
				<xsl:value-of select="$Letter"/>
			</div>
			<div class="styIRS8862CleanDiv" style="width:181mm;height:auto;">
				<div class="styIRS8862LNDesc" style="width:auto;height:auto;">
					<b>Child <xsl:value-of select="$Number"/>
					</b>
					<span style="width:4px;"/>
					<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
					<span style="width:4px;"/>
					<b>(1)</b> Month and day of birth (MM/DD)
					<span style="width:4px;"/>
					<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
					<span style="width:4px;"/>
					<span style="width:6mm;height:100%;text-align:center;border-bottom:1px solid black;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateMonthForMonthDayType">
								<xsl:with-param name="TargetNode" select="$TargetNode/EICEligClmChildBirthMonthDay"/>
							</xsl:call-template>
						</xsl:if>
					</span>
					<b>/</b>
					<span style="width:6mm;height:100%;text-align:center;border-bottom:1px solid black;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateDayForMonthDayType">
								<xsl:with-param name="TargetNode" select="$TargetNode/EICEligClmChildBirthMonthDay"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
				<div class="styIRS8862LNDesc" style="width:auto;height:auto;padding-left:30mm;">
					<b>(2)</b> Month and day of death (MM/DD)
					<span style="width:4px;"/>
					<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
					<span style="width:4px;"/>
					<span style="width:6mm;height:100%;text-align:center;border-bottom:1px solid black;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateMonthForMonthDayType">
								<xsl:with-param name="TargetNode" select="$TargetNode/EICEligChildDeathMonthDay"/>
							</xsl:call-template>
						</xsl:if>
					</span>
					<b>/</b>
					<span style="width:6mm;height:100%;text-align:center;border-bottom:1px solid black;">
						<xsl:if test="$TargetNode">
							<xsl:call-template name="PopulateDayForMonthDayType">
								<xsl:with-param name="TargetNode" select="$TargetNode/EICEligChildDeathMonthDay"/>
							</xsl:call-template>
						</xsl:if>
					</span>
				</div>
			</div>
		</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateLine6ChildItem) -->
	<xsl:template name="CreateLine6ChildItem">
		<xsl:param name="Letter"/>
		<xsl:param name="Position"/>
		<xsl:param name="Number"/>
		<xsl:param name="TargetNode"/>
		<!-- (6#LETTER#) ////////////////////////////////////////////////////-->
		<div class="styIRS8862LineItem">
			<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;height:auto;">
				<xsl:value-of select="$Letter"/>
			</div>
			<div class="styIRS8862LNDesc" style="width:19mm;height:auto;">
				<b>Child <xsl:value-of select="$Number"/>
				</b>
				<span style="width:4px;"/>
				<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
				<span style="width:4px;"/>
			</div>
			<div class="styIRS8862CleanDiv" style="width:162mm;height:auto;">
				<xsl:if test="$Position and ($Position = 2)">
					<div class="styIRS8862LNDesc" style="width:100%;height:auto;padding-left:0px;">
						<b>If same as shown for child 1, check this box.</b>
						<span style="width:3mm;"/>
						<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
						<span style="width:3mm;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithChld2AddrGrp/EICEligClmAddrSameAsChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataEICEligClmLiveWithChld2AddrGrpEICEligClmAddrSameAsChild1Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithChld2AddrGrp/EICEligClmAddrSameAsChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataEICEligClmLiveWithChld2AddrGrpEICEligClmAddrSameAsChild1Ind</xsl:with-param>
							</xsl:call-template>
						</label>
						<span style="width:3mm;"/>
						Otherwise, enter below:
					</div>
				</xsl:if>
				<xsl:if test="$Position and ($Position = 3)">
					<div class="styIRS8862LNDesc" style="width:100%;height:auto;padding-left:0px;">
						<b>If same as shown for child 1, check this box.</b>
						<span style="width:3mm;"/>
						<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
						<span style="width:3mm;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithChld3AddrGrp/EICEligClmAddrSameAsChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataEICEligClmLiveWithChld3AddrGrpEICEligClmAddrSameAsChild1Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithChld3AddrGrp/EICEligClmAddrSameAsChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataEICEligClmLiveWithChld3AddrGrpEICEligClmAddrSameAsChild1Ind</xsl:with-param>
							</xsl:call-template>
						</label>
						<span style="width:3mm;"/>
						<b>Or if same as shown for child 2 (and<br/>
						this is different from address shown for child 1), check this box.</b>
						<span style="width:3mm;"/>
						<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
						<span style="width:3mm;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithChld3AddrGrp/EICEligClmAddrSameAsChild2Ind"/>
								<xsl:with-param name="BackupName">Form8862DataEICEligClmLiveWithChld3AddrGrpEICEligClmAddrSameAsChild2Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithChld3AddrGrp/EICEligClmAddrSameAsChild2Ind"/>
								<xsl:with-param name="BackupName">Form8862DataEICEligClmLiveWithChld3AddrGrpEICEligClmAddrSameAsChild2Ind</xsl:with-param>
							</xsl:call-template>
						</label>						
						<span style="width:3mm;"/>
						Otherwise, enter below:
					</div>
				</xsl:if>
				<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
					<div class="styIRS8862LNDesc" style="width:28mm;height:auto;padding-left:0px;">
						Number and street
						<span style="width:4px;"/>
					</div>
					<div class="styIRS8862LNDesc" style="width:134mm;height:auto;border-bottom-width:1px;border-color:black;border-style:dashed;">
						<xsl:if test="$TargetNode">
							<xsl:if test="count($TargetNode/following-sibling::*) = 0">
								<xsl:choose>
									<xsl:when test="$TargetNode/EICEligClmLivedWithChldUSAddr">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$TargetNode/EICEligClmLivedWithChldUSAddr/AddressLine1"/>
										</xsl:call-template>
										<xsl:if test="$TargetNode/EICEligClmLivedWithChldUSAddr/AddressLine2">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$TargetNode/EICEligClmLivedWithChldUSAddr/AddressLine2"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$TargetNode/EICEligClmLiveWithChldFrgnAddr/AddressLine1"/>
										</xsl:call-template>
										<xsl:if test="$TargetNode/EICEligClmLiveWithChldFrgnAddr/AddressLine2">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$TargetNode/EICEligClmLiveWithChldFrgnAddr/AddressLine2"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
							<xsl:if test="($Position = 1) and (count($Form8862Data/EICEligClmLiveWithChld1AddrGrp/EICEligClmLivedWithChldAddrGrp) &gt; 1)">
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithChld1AddrGrp/EICEligClmLivedWithChldAddrGrp"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Position = 2) and (count($Form8862Data/EICEligClmLiveWithChld2AddrGrp/EICEligClmLivedWithChldAddrGrp) &gt; 1)">
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithChld2AddrGrp/EICEligClmLivedWithChldAddrGrp"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Position = 3) and (count($Form8862Data/EICEligClmLiveWithChld3AddrGrp/EICEligClmLivedWithChldAddrGrp) &gt; 1)">
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithChld3AddrGrp/EICEligClmLivedWithChldAddrGrp"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					</div>
				</div>
				<div class="styIRS8862CleanDiv" style="width:100%;height:4mm;">
					<div class="styIRS8862LNDesc" style="width:45mm;height:4mm;padding-left:0px;padding-right:3px;">
						City or town, state, and ZIP code						
					</div>
					<div class="styIRS8862LNDesc" style="width:117mm;height:4mm;border-bottom-width:1px;border-color:black;border-style:dashed;word-wrap:break-word;">
						<xsl:if test="$TargetNode">
							<xsl:if test="count($TargetNode/following-sibling::*) = 0">
								<xsl:call-template name="PopulateCityStateInfo">
									<xsl:with-param name="TargetNode" select="$TargetNode/EICEligClmLivedWithChldUSAddr"/>
									<xsl:with-param name="ForeignAddressTargetNode" select="$TargetNode/EICEligClmLiveWithChldFrgnAddr"/>
								</xsl:call-template>
								<span style="width:7px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/EICEligClmLiveWithChldFrgnAddr/Country"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateLine7ChildItem) -->
	<xsl:template name="CreateLine7ChildItem">
		<xsl:param name="Letter"/>
		<xsl:param name="Position"/>
		<xsl:param name="Number"/>
		<xsl:param name="TargetNode"/>
		<!-- (7#LETTER#) ////////////////////////////////////////////////////-->
		<div class="styIRS8862LineItem">
			<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">
				<xsl:value-of select="$Letter"/>
			</div>
			<div class="styIRS8862LNDesc" style="width:51mm;height:auto;">
				<b>Other person living with child <xsl:value-of select="$Number"/>:</b>
				<span style="width:4px;"/>
			</div>
			<div class="styIRS8862CleanDiv" style="width:129mm;height:auto;">
				<xsl:if test="$Position and ($Position = 2)">
					<div class="styIRS8862LNDesc" style="width:100%;height:auto;padding-left:0px;">
						<b>If same as shown for child 1, check this box.</b>
						<!--span style="width:3mm;"/-->
						<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
						<!--span style="width:3mm;"/-->
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithPrsnChld2Grp/EICEligClmOthPrsnSameChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataEICEligClmLiveWithPrsnChld2GrpEICEligClmOthPrsnSameChild1Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithPrsnChld2Grp/EICEligClmOthPrsnSameChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataEICEligClmLiveWithPrsnChld2GrpEICEligClmOthPrsnSameChild1Ind</xsl:with-param>
							</xsl:call-template>
						</label>
						<span style="width:3mm;"/>
						Otherwise, enter below:
					</div>
				</xsl:if>
				<xsl:if test="$Position and ($Position = 3)">
					<div class="styIRS8862LNDesc" style="width:100%;height:auto;padding-left:0px;">
						<b>If same as shown for child 1, check this box.</b>
						<!--span style="width:3mm;"/-->
						<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
						<!--span style="width:3mm;"/-->
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithPrsnChld3Grp/EICEligClmOthPrsnSameChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataEICEligClmLiveWithPrsnChld3GrpEICEligClmOthPrsnSameChild1Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithPrsnChld3Grp/EICEligClmOthPrsnSameChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataEICEligClmLiveWithPrsnChld3GrpEICEligClmOthPrsnSameChild1Ind</xsl:with-param>
							</xsl:call-template>
						</label>
						<span style="width:3mm;"/>
						<b>Or if same as shown<br/>
						for child 2 (and this is different from the person living with child 1), check this box.</b>
						<!--span style="width:3mm;"/-->
						<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
						<!--span style="width:3mm;"/-->
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithPrsnChld3Grp/EICEligClmOthPrsnSameChld2Ind"/>
								<xsl:with-param name="BackupName">Form8862DataEICEligClmLiveWithPrsnChld3GrpEICEligClmOthPrsnSameChld2Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithPrsnChld3Grp/EICEligClmOthPrsnSameChld2Ind"/>
								<xsl:with-param name="BackupName">Form8862DataEICEligClmLiveWithPrsnChld3GrpEICEligClmOthPrsnSameChld2Ind</xsl:with-param>
							</xsl:call-template>
						</label>
						<br/>
						Otherwise, enter below:
					</div>
				</xsl:if>
				<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
					<div class="styIRS8862LNDesc" style="width:9mm;height:auto;padding-left:0px;padding-right:3px;">
						Name						
					</div>
					<div class="styIRS8862LNDesc" style="width:118mm;height:auto;border-bottom-width:1px;border-color:black;border-style:dashed;float:right;">
						<xsl:if test="$TargetNode">
							<xsl:if test="count($TargetNode/following-sibling::*) = 0">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/EICEligClmOtherPersonName"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Position = 1) and (count($Form8862Data/EICEligClmLiveWithPrsnChld1Grp/EICEligClmLiveWithOthPersonGrp) &gt; 1)">
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithPrsnChld1Grp/EICEligClmLiveWithOthPersonGrp"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Position = 2) and (count($Form8862Data/EICEligClmLiveWithPrsnChld2Grp/EICEligClmLiveWithOthPersonGrp) &gt; 1)">
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithPrsnChld2Grp/EICEligClmLiveWithOthPersonGrp"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Position = 3) and (count($Form8862Data/EICEligClmLiveWithPrsnChld3Grp/EICEligClmLiveWithOthPersonGrp) &gt; 1)">
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithPrsnChld3Grp/EICEligClmLiveWithOthPersonGrp"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					</div>
				</div>
				<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
					<div class="styIRS8862LNDesc" style="width:auto;height:auto;padding-left:0px;">
						Relationship to child <xsl:value-of select="$Number"/>
						<span style="width:4px;"/>
					</div>
					<div class="styIRS8862LNDesc" style="width:95mm;height:auto;border-bottom-width:1px;border-color:black;border-style:dashed;word-wrap:break-word;float:right;">
						<xsl:if test="$TargetNode">
							<xsl:if test="count($TargetNode/following-sibling::*) = 0">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/EICEligClmOtherPersonRlnDesc"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8862Data)"/>
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
				<meta name="Description" content="IRS Form 8862"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8862Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS8862" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">  8862</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8862Data"/>
							</xsl:call-template>
							<span class="styAgency">(Rev. December 2012)</span>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;">
								Information To Claim Earned Income Credit<br/>
								After Disallowance
							</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:5mm;padding-left:5px;">
										<div style="width:100%;height:5mm;">
											<br/>
											<br/>
											<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to your tax return.<br/>
											<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/> 
											Information about Form 8862 and its instructions is at <i>www.irs.gov/form8862</i>.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;height:22mm;">
							<div class="styOMB" style="height:50%;font-size:7pt;padding-top:3mm;">OMB No. 1545-0074</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;height:50%;padding-top:3.5mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">43A</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
							</xsl:call-template>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8862LineItem" style="height:4mm;"/>
						<!-- Before You Begin (start) -->
						<div class="styIRS8862LineItem">
							<div class="styIRS8862CleanDiv" style="width:28mm;font-size:9pt;">
								<b>
									<span class="styItalicText">Before you begin:</span>
								</b>
							</div>
							<div class="styIRS8862CleanDiv" style="width:158mm;">
								<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
									<div class="styIRS8862LNLeftNumBox">
										<img src="{$ImagePath}/8862_Check.gif" alt="Check"/>
									</div>
									<div class="styIRS8862LNDesc" style="height:100%;width:auto;">
										See your tax return instructions or <b>Pub. 596</b>, Earned Income Credit (EIC), for the year for which you are filing<br/>
										this form to make sure you can take the earned income credit (EIC) <b>and</b> to find out who is a qualifying child.
									</div>
								</div>
								<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
									<div class="styIRS8862LNLeftNumBox">
										<img src="{$ImagePath}/8862_Check.gif" alt="Check"/>
									</div>
									<div class="styIRS8862LNDesc" style="height:100%;width:auto;">
										If you have a qualifying child, complete <b>Schedule EIC</b> before you fill in this form.
									</div>
								</div>
								<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
									<div class="styIRS8862LNLeftNumBox">
										<img src="{$ImagePath}/8862_Check.gif" alt="Check"/>
									</div>
									<div class="styIRS8862LNDesc" style="height:100%;width:auto;">
										<b>Do not</b> file this form if you are taking the EIC without a qualifying child <b>and</b> the only reason your EIC was<br/>
										reduced or disallowed in the earlier year was because it was determined that a child listed on <b>Schedule<br/>
										EIC</b> was not your qualifying child.
									</div>
								</div>
							</div>
						</div>
						<!-- Before You Begin (end) -->
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							All Filers
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox">1</div>
							<div class="styIRS8862CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS8862LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:auto;height:100%;">
										Enter the year for which you are filing this form (for example, 2012)
									</div>
									<div class="styIRS8862LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
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
											<span style="width:11px"/>
											<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
										</span>
									</div>
								</div>
							</div>
							<span style="width:17mm;float:right;"/>
							<div class="styIRS8862LNDesc" style="width:20mm;height:100%;padding-left:0px;padding-top:1px;float:right;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmFilingYr"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox">2</div>
							<div class="styIRS8862CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS8862LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:auto;height:100%;">
										If the <b>only</b> reason your EIC was reduced or disallowed in the earlier year was because you incorrectly
										reported your earned income or investment income, check “Yes.” Otherwise, check “No”
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:17px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>
										</span>
										<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
								</div>
							</div>
							<div class="styIRS8862LNDesc" style="width:37mm;height:100%;padding-left:0px;padding-top:4mm;float:right;">
								<span style="float:left;width:auto;height:auto;">
									<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmIncmIncorrectRptInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmIncmIncorrectRptInd"/>
												<xsl:with-param name="BackupName">IRS8862EICEligClmIncmIncorrectRptInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmIncmIncorrectRptInd"/>
											<xsl:with-param name="BackupName">IRS8862EICEligClmIncmIncorrectRptInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								</span>
								<span style="float:right;width:auto;height:auto;">
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmIncmIncorrectRptInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmIncmIncorrectRptInd"/>
												<xsl:with-param name="BackupName">IRS8862EICEligClmIncmIncorrectRptInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmIncmIncorrectRptInd"/>
											<xsl:with-param name="BackupName">IRS8862EICEligClmIncmIncorrectRptInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
								</span>
							</div>
						</div>
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox"/>
							<div class="styIRS8862LNDesc" style="width:181mm;height:auto;">
								<b>Caution.</b>
								<span style="width:4px;"/>If you checked “Yes,” <b>stop. Do not</b> fill in the rest of this form. But you must attach it to your tax return to take the<br/>
								EIC. If you checked “No,” continue.
							</div>
						</div>
						<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox">3</div>
							<div class="styIRS8862CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS8862LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:auto;height:100%;">
										Could you (or your spouse if filing jointly) be claimed as a qualifying child of another taxpayer for the year<br/>
										shown on line 1? See the instructions before answering
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:21px"/>.
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
											<span style="width:9px"/>
										</span>
										<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
								</div>
							</div>
							<div class="styIRS8862LNDesc" style="width:37mm;height:100%;padding-left:0px;padding-top:4mm;float:right;">
								<span style="float:left;width:auto;height:auto;">
									<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQlfyChldOfOtherInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQlfyChldOfOtherInd"/>
												<xsl:with-param name="BackupName">IRS8862EICEligClmQlfyChldOfOtherInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQlfyChldOfOtherInd"/>
											<xsl:with-param name="BackupName">IRS8862EICEligClmQlfyChldOfOtherInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								</span>
								<span style="float:right;width:auto;height:auto;">
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQlfyChldOfOtherInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQlfyChldOfOtherInd"/>
												<xsl:with-param name="BackupName">IRS8862EICEligClmQlfyChldOfOtherInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQlfyChldOfOtherInd"/>
											<xsl:with-param name="BackupName">IRS8862EICEligClmQlfyChldOfOtherInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
								</span>
							</div>
						</div>
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox"/>
							<div class="styIRS8862LNDesc" style="width:181mm;height:auto;">
								<b>Caution.</b>
								<span style="width:4px;"/>If you checked “Yes,” <b>stop.</b> You cannot take the EIC. If you checked “No,” continue.
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Filers With a Qualifying Child or Children
						</div>
					</div>
					<!-- Body -->
					<div class="styTBB" style="width:187mm;">
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox"/>
							<div class="styIRS8862LNDesc" style="width:181mm;height:auto;">
								<b>Note. Child 1, Child 2, </b>and <b>Child 3</b> are the same children you listed as Child 1, Child 2, and Child 3 on <b>Schedule EIC</b> for the year<br/>
								shown on line 1 above.
							</div>
						</div>
						<!-- (4) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox">4</div>
							<div class="styIRS8862LNDesc" style="width:181mm;height:auto;">
								Enter the <b>number of days</b> each child lived with you in the United States during the year shown on line 1 above:
							</div>
						</div>
						<!-- (4a) ////////////////////////////////////////////////////-->
						<xsl:variable name="CntEICEligClmQualifyingChildInfoGrp" select="count($Form8862Data/EICEligClmQualifyingChildInfo)"/>
						<div class="styIRS8862LineItem" style="width:20%;float:left;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">a</div>
							<div class="styIRS8862LNDesc" style="width:auto;height:auto;">
								<b>Child 1</b>
								<span style="width:4px;"/>
								<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:4px;"/>
								<span style="width:12mm;height:100%;border-bottom:1px solid black;">
									<xsl:if test="$CntEICEligClmQualifyingChildInfoGrp &gt;= 1">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQualifyingChildInfo[1]/EICEligClmDaysChldLivedInUSCnt"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (4b) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:20%;float:left;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">b</div>
							<div class="styIRS8862LNDesc" style="width:auto;height:auto;">
								<b>Child 2</b>
								<span style="width:4px;"/>
								<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:4px;"/>
								<span style="width:12mm;height:100%;border-bottom:1px solid black;">
									<xsl:if test="$CntEICEligClmQualifyingChildInfoGrp &gt;= 2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQualifyingChildInfo[2]/EICEligClmDaysChldLivedInUSCnt"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (4c) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:20%;float:left;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">c</div>
							<div class="styIRS8862LNDesc" style="width:auto;height:auto;">
								<b>Child 3</b>
								<span style="width:4px;"/>
								<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:4px;"/>
								<span style="width:12mm;height:100%;border-bottom:1px solid black;">
									<xsl:if test="$CntEICEligClmQualifyingChildInfoGrp = 3">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQualifyingChildInfo[3]/EICEligClmDaysChldLivedInUSCnt"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox"/>
							<div class="styIRS8862LNDesc" style="width:181mm;height:auto;">
								<b>Caution.</b>
								<span style="width:4px;"/>If you entered less than <b>183</b> (184 if the year on line 1 is 2012) for any child, you cannot take the EIC based on that child, <br/>
								unless the special rule for a child who was born or died during the year shown on line 1 applies. See the instructions.
							</div>
						</div>
						<!-- (5) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox">5</div>
							<div class="styIRS8862LNDesc" style="width:181mm;height:auto;">
								If your child was born or died during the year shown on line 1, enter the month and day the child was born and/or died.<br/>
								Otherwise, skip this line.
							</div>
						</div>
						<xsl:call-template name="CreateLine5ChildItem">
							<xsl:with-param name="Letter">a</xsl:with-param>
							<xsl:with-param name="Number">1</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQualifyingChildInfo[1]"/>
						</xsl:call-template>
						<xsl:call-template name="CreateLine5ChildItem">
							<xsl:with-param name="Letter">b</xsl:with-param>
							<xsl:with-param name="Number">2</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQualifyingChildInfo[2]"/>
						</xsl:call-template>
						<xsl:call-template name="CreateLine5ChildItem">
							<xsl:with-param name="Letter">c</xsl:with-param>
							<xsl:with-param name="Number">3</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQualifyingChildInfo[3]"/>
						</xsl:call-template>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox">6</div>
							<div class="styIRS8862LNDesc" style="width:181mm;height:auto;">
								Enter the address where you and the child lived together during the year shown on line 1. If you lived with the child at more<br/>
								than one address during the year, attach a list of the addresses where you lived:
							</div>
						</div>
						<xsl:call-template name="CreateLine6ChildItem">
							<xsl:with-param name="Letter">a</xsl:with-param>
							<xsl:with-param name="Number">1</xsl:with-param>
							<xsl:with-param name="Position">1</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithChld1AddrGrp/EICEligClmLivedWithChldAddrGrp[1]"/>
						</xsl:call-template>
						<xsl:call-template name="CreateLine6ChildItem">
							<xsl:with-param name="Letter">b</xsl:with-param>
							<xsl:with-param name="Number">2</xsl:with-param>
							<xsl:with-param name="Position">2</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithChld2AddrGrp/EICEligClmLivedWithChldAddrGrp[1]"/>
						</xsl:call-template>
						<xsl:call-template name="CreateLine6ChildItem">
							<xsl:with-param name="Letter">c</xsl:with-param>
							<xsl:with-param name="Number">3</xsl:with-param>
							<xsl:with-param name="Position">3</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithChld3AddrGrp/EICEligClmLivedWithChldAddrGrp[1]"/>
						</xsl:call-template>
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox">7</div>
							<div class="styIRS8862CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS8862LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:auto;height:100%;">
										Did any other person (except your spouse, if filing jointly, and your dependents under age 19) live with<br/>
										child 1, child 2, or child 3 for more than half the year shown on line 1?
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
											<span style="width:11px"/>
										</span>
										<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
								</div>
							</div>
							<div class="styIRS8862LNDesc" style="width:37mm;height:100%;padding-left:0px;padding-top:4mm;float:right;">
								<span style="float:left;width:auto;height:auto;">
									<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLivedWithOthersInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLivedWithOthersInd"/>
												<xsl:with-param name="BackupName">IRS8862EICEligClmLivedWithOthersInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLivedWithOthersInd"/>
											<xsl:with-param name="BackupName">IRS8862EICEligClmLivedWithOthersInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								</span>
								<span style="float:right;width:auto;height:auto;">
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLivedWithOthersInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLivedWithOthersInd"/>
												<xsl:with-param name="BackupName">IRS8862EICEligClmLivedWithOthersInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLivedWithOthersInd"/>
											<xsl:with-param name="BackupName">IRS8862EICEligClmLivedWithOthersInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
								</span>
							</div>
						</div>
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox"/>
							<div class="styIRS8862LNDesc" style="width:181mm;height:auto;">
								If “Yes,” enter that person’s name and relationship to the child below. If more than one other person lived<br/>
								with the child for more than half the year, attach a list of each person’s name and relationship to the child:
							</div>
						</div>
						<xsl:call-template name="CreateLine7ChildItem">
							<xsl:with-param name="Letter">a</xsl:with-param>
							<xsl:with-param name="Number">1</xsl:with-param>
							<xsl:with-param name="Position">1</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithPrsnChld1Grp/EICEligClmLiveWithOthPersonGrp[1]"/>
						</xsl:call-template>
						<xsl:call-template name="CreateLine7ChildItem">
							<xsl:with-param name="Letter">b</xsl:with-param>
							<xsl:with-param name="Number">2</xsl:with-param>
							<xsl:with-param name="Position">2</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithPrsnChld2Grp/EICEligClmLiveWithOthPersonGrp[1]"/>
						</xsl:call-template>
						<xsl:call-template name="CreateLine7ChildItem">
							<xsl:with-param name="Letter">c</xsl:with-param>
							<xsl:with-param name="Number">3</xsl:with-param>
							<xsl:with-param name="Position">3</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmLiveWithPrsnChld3Grp/EICEligClmLiveWithOthPersonGrp[1]"/>
						</xsl:call-template>
						<!-- ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNDesc" style="width:100%;height:auto;padding:0px 0px 0px 0px;text-align:center;">
								<b>Caution.</b> The IRS may ask you to provide additional information to verify your eligibility to claim the EIC.
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
								For Paperwork Reduction Act Notice, see back of form.
							</span>
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8862</span> (Rev. 12-2012)
						</div>
						<div style="float:right;text-align:center;width:26mm;font-size:7pt;">
							Cat. No. 25145E
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
							Form 8862 (Rev. 12-2012)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part III																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Filers Without a Qualifying Child
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;">
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox">8</div>
							<div class="styIRS8862CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS8862LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:auto;height:100%;">
										Enter the <b>number of days</b> during the year shown on line 1 that you lived in the United States
									</div>
									<div class="styIRS8862LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>
											<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
										</span>
									</div>
								</div>
							</div>
							<span style="width:17mm;float:right;"/>
							<div class="styIRS8862LNDesc" style="width:20mm;height:100%;padding-left:0px;padding-top:1px;float:right;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmDaysLivedInUSCnt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox"/>
							<div class="styIRS8862LNDesc" style="width:181mm;height:auto;">
								<b>Caution.</b><span style="width:3px;"/>If you entered less than <b>183 (184 if the year on line 1 is 2012), stop.</b> You cannot take the EIC. See the instructions.
							</div>
						</div>
						<!-- (9) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox">9</div>
							<div class="styIRS8862CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
								<div class="styIRS8862LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:auto;height:100%;">
										If married filing a joint return, enter the <b>number of days</b> during the year shown on line 1 that your spouse<br/>
										lived in the United States
										<!--Dotted Line-->
										<span class="styBoldText">
											<span style="width:19px"/>.
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
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>.
											<span style="width:11px"/>
										</span>
										<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
								</div>
							</div>
							<span style="width:17mm;float:right;"/>
							<div class="styIRS8862LNDesc" style="width:20mm;height:100%;padding-left:0px;padding-top:4mm;float:right;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmDaysSpsLivedInUSCnt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styIRS8862LineItem">
							<div class="styIRS8862LNLeftNumBox"/>
							<div class="styIRS8862LNDesc" style="width:181mm;height:auto;">
								<b>Caution.</b><span style="width:3px;"/>If you entered less than <b>183 (184 if the year on line 1 is 2012), stop.</b> You cannot take the EIC. See the instructions.
							</div>
						</div>
						<br/>
					</div>
					
					<!-- Page Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:0mm;border-top-width:1px;">						
						<div style="float:right;">
							<span style="width:40px;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">8862</span> (Rev. 12-2012)
                        </div>
					 </div>
					
					
					  
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">100</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8862Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
					<!-- Separated Data for Part II - Line 6 (a) -->
					<xsl:if test="count($Form8862Data/EICEligClmLiveWithChld1AddrGrp/EICEligClmLivedWithChldAddrGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8862, Part II - Line 6 (a)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS8862TableCell" scope="col" style="width:5%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Child</th>
									<th class="styIRS8862TableCell" scope="col" style="width:50%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Number and street</th>
									<th class="styIRS8862TableCell" scope="col" style="width:45%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">City or town, state, and ZIP code</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8862Data/EICEligClmLiveWithChld1AddrGrp/EICEligClmLivedWithChldAddrGrp">
									<tr style="font-size:7pt;font-family:arial;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:5%;text-align:center;</xsl:attribute>
											<b><xsl:number value="position()" format="1"/></b>
										</td>
										<!-- (Number and street) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:50%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:choose>
													<xsl:when test="EICEligClmLivedWithChldUSAddr">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr/AddressLine1"/>
														</xsl:call-template>
														<xsl:if test="EICEligClmLivedWithChldUSAddr/AddressLine2">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr/AddressLine2"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/AddressLine1"/>
														</xsl:call-template>
														<xsl:if test="EICEligClmLiveWithChldFrgnAddr/AddressLine2">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/AddressLine2"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</div>
										</td>
										<!-- (City or town, state, and ZIP code) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:45%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateCityStateInfo">
													<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr"/>
													<xsl:with-param name="ForeignAddressTargetNode" select="EICEligClmLiveWithChldFrgnAddr"/> 
												</xsl:call-template>
												<span style="width:7px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/Country"/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part II - Line 6 (b) -->
					<xsl:if test="count($Form8862Data/EICEligClmLiveWithChld2AddrGrp/EICEligClmLivedWithChldAddrGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8862, Part II - Line 6 (b)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS8862TableCell" scope="col" style="width:5%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Child</th>
									<th class="styIRS8862TableCell" scope="col" style="width:50%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Number and street</th>
									<th class="styIRS8862TableCell" scope="col" style="width:45%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">City or town, state, and ZIP code</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8862Data/EICEligClmLiveWithChld2AddrGrp/EICEligClmLivedWithChldAddrGrp">
									<tr style="font-size:7pt;font-family:arial;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:5%;text-align:center;</xsl:attribute>
											<b><xsl:number value="position()" format="1"/></b>
										</td>
										<!-- (Number and street) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:50%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:choose>
													<xsl:when test="EICEligClmLivedWithChldUSAddr">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr/AddressLine1"/>
														</xsl:call-template>
														<xsl:if test="EICEligClmLivedWithChldUSAddr/AddressLine2">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr/AddressLine2"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/AddressLine1"/>
														</xsl:call-template>
														<xsl:if test="EICEligClmLiveWithChldFrgnAddr/AddressLine2">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/AddressLine2"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</div>
										</td>
										<!-- (City or town, state, and ZIP code) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:45%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateCityStateInfo">
													<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr"/>
													<xsl:with-param name="ForeignAddressTargetNode" select="EICEligClmLiveWithChldFrgnAddr"/> 
												</xsl:call-template>
												<span style="width:7px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/Country"/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part II - Line 6 (c) -->
					<xsl:if test="count($Form8862Data/EICEligClmLiveWithChld3AddrGrp/EICEligClmLivedWithChldAddrGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8862, Part II - Line 6 (c)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS8862TableCell" scope="col" style="width:5%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Child</th>
									<th class="styIRS8862TableCell" scope="col" style="width:50%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Number and street</th>
									<th class="styIRS8862TableCell" scope="col" style="width:45%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">City or town, state, and ZIP code</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8862Data/EICEligClmLiveWithChld3AddrGrp/EICEligClmLivedWithChldAddrGrp">
									<tr style="font-size:7pt;font-family:arial;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:5%;text-align:center;</xsl:attribute>
											<b><xsl:number value="position()" format="1"/></b>
										</td>
										<!-- (Number and street) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:50%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:choose>
													<xsl:when test="EICEligClmLivedWithChldUSAddr">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr/AddressLine1"/>
														</xsl:call-template>
														<xsl:if test="EICEligClmLivedWithChldUSAddr/AddressLine2">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr/AddressLine2"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/AddressLine1"/>
														</xsl:call-template>
														<xsl:if test="EICEligClmLiveWithChldFrgnAddr/AddressLine2">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/AddressLine2"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</div>
										</td>
										<!-- (City or town, state, and ZIP code) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:45%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateCityStateInfo">
													<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr"/>
													<xsl:with-param name="ForeignAddressTargetNode" select="EICEligClmLiveWithChldFrgnAddr"/> 
												</xsl:call-template>
												<span style="width:7px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/Country"/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part II - Line 7 (a) -->
					<xsl:if test="count($Form8862Data/EICEligClmLiveWithPrsnChld1Grp/EICEligClmLiveWithOthPersonGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8862, Part II - Line 7 (a)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS8862TableCell" scope="col" style="width:5%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Child</th>
									<th class="styIRS8862TableCell" scope="col" style="width:50%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Name</th>
									<th class="styIRS8862TableCell" scope="col" style="width:45%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Relationship</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8862Data/EICEligClmLiveWithPrsnChld1Grp/EICEligClmLiveWithOthPersonGrp">
									<tr style="font-size:7pt;font-family:arial;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:5%;text-align:center;</xsl:attribute>
											<b><xsl:number value="position()" format="1"/></b>
										</td>
										<!-- (Name) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:50%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmOtherPersonName"/>
												</xsl:call-template>
											</div>
										</td>
										<!-- (Relationship) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:45%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmOtherPersonRlnDesc"/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part II - Line 7 (b) -->
					<xsl:if test="count($Form8862Data/EICEligClmLiveWithPrsnChld2Grp/EICEligClmLiveWithOthPersonGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8862, Part II - Line 7 (b)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS8862TableCell" scope="col" style="width:5%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Child</th>
									<th class="styIRS8862TableCell" scope="col" style="width:50%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Name</th>
									<th class="styIRS8862TableCell" scope="col" style="width:45%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Relationship</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8862Data/EICEligClmLiveWithPrsnChld2Grp/EICEligClmLiveWithOthPersonGrp">
									<tr style="font-size:7pt;font-family:arial;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:5%;text-align:center;</xsl:attribute>
											<b><xsl:number value="position()" format="1"/></b>
										</td>
										<!-- (Name) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:50%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmOtherPersonName"/>
												</xsl:call-template>
											</div>
										</td>
										<!-- (Relationship) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:45%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmOtherPersonRlnDesc"/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part II - Line 7 (c) -->
					<xsl:if test="count($Form8862Data/EICEligClmLiveWithPrsnChld3Grp/EICEligClmLiveWithOthPersonGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8862, Part II - Line 7 (c)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS8862TableCell" scope="col" style="width:5%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Child</th>
									<th class="styIRS8862TableCell" scope="col" style="width:50%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Name</th>
									<th class="styIRS8862TableCell" scope="col" style="width:45%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Relationship</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8862Data/EICEligClmLiveWithPrsnChld3Grp/EICEligClmLiveWithOthPersonGrp">
									<tr style="font-size:7pt;font-family:arial;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:5%;text-align:center;</xsl:attribute>
											<b><xsl:number value="position()" format="1"/></b>
										</td>
										<!-- (Name) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:50%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmOtherPersonName"/>
												</xsl:call-template>
											</div>
										</td>
										<!-- (Relationship) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:45%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmOtherPersonRlnDesc"/>
												</xsl:call-template>
											</div>
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
</xsl:stylesheet>
