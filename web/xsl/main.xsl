<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:nsm="http://www.uts.edu.au/31284/oms">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>      
            <head>
                <link rel="stylesheet" href="blockbuster.css" type="text/css"></link>
            </head>     
            <body>
                <br></br>
                <h2>Orders you've made will appear below. Click on an ID to cancel the order.</h2>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="nsm:order">
        <br></br>
        <h3><a>
                    <xsl:attribute name="href">
                        <xsl:text>ordercancelaction.jsp?orderid=</xsl:text>
                        <xsl:value-of select="nsm:id"/>
                    </xsl:attribute>
                    Order ID: <xsl:value-of select="nsm:id"/>
        </a></h3>
        <table width = "50%" border="1">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Release Date</th>
                    <th>Price</th>
                    <th>Purchased</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="nsm:movie"/>
            </tbody>
        </table>
        <p>Payment method: <xsl:value-of select="nsm:paymentmethod"/><br></br>
        Sale total: $<xsl:value-of select="nsm:saletotal"/><br></br>
        Order status: <xsl:value-of select="nsm:status"/></p>
    </xsl:template>
    
    <xsl:template match="nsm:movie">
        <tr>
            <td>
                <xsl:value-of select="nsm:title"/>
            </td>
            <td>
                <xsl:value-of select="nsm:genre"/>
            </td>
            <td>
                <xsl:value-of select="nsm:releasedate" />
            </td>
            <td>
                <xsl:value-of select="nsm:price" />
            </td>
            <td>
                <xsl:value-of select="nsm:purchased" />
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>