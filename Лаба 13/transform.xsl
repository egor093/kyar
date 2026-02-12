<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <head>
            <title>Товары интернет-магазина</title>
            <style>
                body {
                    margin: 20px;
                    background-color: #f9f9f9;
                }
                table {
                    width: 100%;
                    border-collapse: collapse;
                }
                th, td {
                    padding: 10px;
                    border: 1px solid #ccc;
                    text-align: left;
                }
                th {
                    background-color: #f0f0f0;
                }
                tr:nth-child(even) {
                    background-color: #f9f9f9;
                }
                .price {
                    color: green;
                    font-weight: bold;
                }
                .unavailable {
                    color: red;
                }
            </style>
        </head>
        <body>
            <h1>Товары интернет-магазина</h1>
            <table>
                <tr>
                    <th>Название</th>
                    <th>Категория</th>
                    <th>Цена (₽)</th>
                    <th>Наличие</th>
                </tr>
                <xsl:for-each select="store/product">
                <xml:sort order = "ascending" select= "price" data-type = "number"/>
                    <tr>
                        <td><xsl:value-of select="name"/></td>
                        <td><xsl:value-of select="category"/></td>
                        <td class="price"><xsl:value-of select="price"/></td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="availability='В наличии'">
                                    <span class="availability"><xsl:value-of select="availability"/></span>
                                </xsl:when>
                                <xsl:otherwise>
                                    <span class="availability unavailable"><xsl:value-of select="availability"/></span>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
