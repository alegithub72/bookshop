SELECT  *
FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY OrderDate ) AS RowNum, *
          FROM      Orders
          WHERE     OrderDate >= '1980-01-01'
        ) AS RowConstrainedResult
WHERE   RowNum >= 1
    AND RowNum < 20
ORDER BY RowNum