<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Аттестация студентов</title>
                <style>
                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 8px;
                        text-align: center;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                    /* Условия для оценки */
                    .low-grade {
                        background-color: #ffcdd2;
                        color: #c62828;
                    }
                    .high-grade {
                        background-color: #c8e6c9;
                        color: #2e7d32;
                    }
                </style>
            </head>
            <body>
                <h1 style="text-align: center;">Результаты аттестации студентов</h1>
                <table>
                    <tr>
                        <th>Фамилия и имя</th>
                        <th>Предмет</th>
                        <th>Оценка</th>
                    </tr>
                    <!-- Процесс обработки каждого студента -->
                    <xsl:for-each select="student">
                        <tr>
                            <td><xsl:value-of select="name"/></td>
                            <td><xsl:value-of select="subject"/></td>
                            <!-- Условие для отображения цвета оценки -->
                            <td>
                                <xsl:choose>
                                    <!-- Если оценка меньше 4, то красный фон -->
                                    <xsl:when test="grade &lt; 4">
                                        <span class="low-grade"><xsl:value-of select="grade"/></span>
                                    </xsl:when>
                                    <!-- Если оценка больше 8, то зеленый фон -->
                                    <xsl:when test="grade &gt; 8">
                                        <span class="high-grade"><xsl:value-of select="grade"/></span>
                                    </xsl:when>
                                    <!-- Иначе, обычная ячейка -->
                                    <xsl:otherwise>
                                        <xsl:value-of select="grade"/>
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
