<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:nsm="http://www.uts.edu.au/31284/oms">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>      
            <head>
                <link rel="stylesheet" href="blockbuster.css" type="text/css"></link>
            </head>     
            <body class="aligncenter">
                <h1>Movies</h1>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="nsm:movies" >
        <form action="confirm.jsp" method="post">
            <table class="aligncenter">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Genre</th>
                        <th>Release Date</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:apply-templates />
                </tbody>
            </table>
        </form>
    </xsl:template>
    
    <xsl:template match="nsm:movie">
        <tr>
            <td>
                <xsl:value-of select="nsm:title" />                
            </td>
            <td>
                <xsl:value-of select="nsm:genre"/>
            </td>
            <td>
                <xsl:value-of select="nsm:releasedate" />
            </td>
            <td>
                <xsl:value-of select="nsm:price" /> each
            </td>
            <td>
                <xsl:value-of select="nsm:quantity" />
            </td>
            <td>
                <a>
                    <xsl:attribute name="href">
                        <xsl:text>removefromcartaction.jsp?selectedmovie=</xsl:text>
                        <xsl:value-of select="nsm:title"/>
                    </xsl:attribute>
                    Remove a copy
                </a>
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>