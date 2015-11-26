<?xml version="1.0" encoding="UTF-8" ?>
<!-- 


    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/
	Developed by DSpace @ Lyncode <dspace@lyncode.com>

 -->
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:doc="http://www.lyncode.com/xoai"
        version="1.0" xmlns:xls="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" method="xml" indent="yes" />

    <xsl:template match="/">
        <rioxx:rioxx xmlns:rioxx="http://www.rioxx.net/schema/v2.0/rioxx/"
                     xmlns:rioxxterms="http://www.rioxx.net/schema/v2.0/rioxxterms/"
                     xmlns:dc="http://purl.org/dc/elements/1.1/"
                     xmlns:dcterms="http://purl.org/dc/terms/"
                     xmlns:ali="http://ali.niso.org/2014/ali/1.0">

            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='available']/doc:element/doc:field[@name='value']">
                <ali:free_to_read>
                    <xsl:attribute name="start_date">
                        <xsl:value-of select="." />
                    </xsl:attribute>
                </ali:free_to_read>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='rights']/doc:element/doc:field[@name='value']">
                <xsl:if test="starts-with(.,'http')">
                <ali:license_ref>
                    <xsl:if test="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='available']/doc:element/doc:field[@name='value']">
                    <xsl:attribute name="start_date">
                        <xsl:value-of select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='available']/doc:element/doc:field[@name='value'][0]" />
                    </xsl:attribute>
                    </xsl:if>
                    <xls:value-of select="."/>
                </ali:license_ref>
                </xsl:if>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='coverage']/doc:element/doc:element/doc:field[@name='value']">
                    <dc:coverage>
                        <xls:value-of select="."/>
                    </dc:coverage>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='description']/doc:element[@name='abstract']/doc:element/doc:field[@name='value']">
                <dc:description>
                    <xls:value-of select="."/>
                </dc:description>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='bundles']/doc:element[@name='bundle']/doc:element[@name='bitstreams']/doc:element[@name='bitstream']/doc:field[@name='format']">
                <dc:format>
                    <xls:value-of select="."/>
                </dc:format>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='bundles']/doc:element[@name='bundle']/doc:element[@name='bitstreams']/doc:element[@name='bitstream']/doc:field[@name='url']">
                <dc:identifier>
                    <xls:value-of select="."/>
                </dc:identifier>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='language']/doc:element[@name='iso']/doc:element/doc:field[@name='value']">
                <dc:language>
                    <xls:value-of select="."/>
                </dc:language>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='publisher']/doc:element/doc:field[@name='value']">
                <dc:publisher>
                    <xls:value-of select="."/>
                </dc:publisher>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='relation']/doc:element[@name='uri']/doc:element/doc:field[@name='value']">
                <dc:relation>
                    <xls:value-of select="."/>
                </dc:relation>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element/doc:element/doc:field[@name='value']">
                <dc:source>
                    <xls:value-of select="."/>
                </dc:source>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='subject']/doc:element/doc:field[@name='value']">
                <dc:subject>
                    <xls:value-of select="."/>
                </dc:subject>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='title']/doc:element/doc:field[@name='value']">
                <dc:title>
                    <xls:value-of select="."/>
                </dc:title>
            </xsl:for-each>


            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='issued']/doc:element/doc:field[@name='value']">
                <dcterms:dateAccepted>
                    <xls:value-of select="."/>
                </dcterms:dateAccepted>
            </xsl:for-each>

            <!--<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='issued']/doc:element/doc:field[@name='value']">-->
                <rioxxterms:apc>
                    <xsl:text>unknown</xsl:text>
                    <!--<xls:value-of select="."/>-->
                </rioxxterms:apc>
            <!--</xsl:for-each>-->


            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[@name='author']/doc:element/doc:field[@name='value']">
                <rioxxterms:author>
                <xsl:attribute name="first-named-author">
                    <xsl:choose>
                        <xsl:when test="position()=1">
                            <xsl:text>true</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>false</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                    <xls:value-of select="."/>
                </rioxxterms:author>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='contributor']/doc:element[not(@name='author')]/doc:element/doc:field[@name='value']">
                <rioxxterms:contributor>
                    <xls:value-of select="."/>
                </rioxxterms:contributor>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='others']/doc:element/doc:field[@name='handle']">
                <rioxxterms:project>
                    <xls:value-of select="."/>
                </rioxxterms:project>
            </xsl:for-each>


            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='date']/doc:element[@name='issued']/doc:element/doc:field[@name='value']">
                <rioxxterms:publication_date>
                    <xls:value-of select="."/>
                </rioxxterms:publication_date>
            </xsl:for-each>

            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:field[@name='value']">
               <rioxxterms:type>
                    <xls:value-of select="."/>
                </rioxxterms:type>
            </xsl:for-each>

            <!--<xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='type']/doc:element/doc:field[@name='value']">-->
                <rioxxterms:version>
                    <xsl:text>NA</xsl:text>
                    <!--<xls:value-of select="."/>-->
                </rioxxterms:version>
            <!--</xsl:for-each>-->

            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='doi']/doc:element/doc:field[@name='value']">
                <rioxxterms:version_of_record>
                    <xls:value-of select="."/>
                </rioxxterms:version_of_record>
            </xsl:for-each>

            <xsl:variable name="projectIdentifier">
                <xsl:value-of select="doc:metadata/doc:element[@name='dc']/doc:element[@name='identifier']/doc:element[@name='project']/doc:element/doc:field[@name='value']"/>

            </xsl:variable>
            <xsl:for-each select="doc:metadata/doc:element[@name='dc']/doc:element[@name='funder']">
                <rioxxterms:project>
                    <xsl:attribute name="funder_name">
                        <xls:value-of select="//doc:element/doc:field[@name='value']"/>
                    </xsl:attribute>
                    <xsl:if test="//doc:element/doc:field[@name='authorityID']">
                        <xsl:attribute name="funder_id">
                            <xls:value-of select="//doc:element/doc:field[@name='authorityID']"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="$projectIdentifier"/>
                </rioxxterms:project>
            </xsl:for-each>


        </rioxx:rioxx>
    </xsl:template>
</xsl:stylesheet>
