-- 없어진 기록 찾기
SELECT
    B.ANIMAL_ID,
    B.NAME
    FROM ANIMAL_INS A
        RIGHT JOIN ANIMAL_OUTS B
        ON A.ANIMAL_ID = B.ANIMAL_ID
    WHERE A.ANIMAL_ID IS NULL
    ORDER BY B.ANIMAL_ID;

-- 있었는데요 없었습니다
SELECT
    A.ANIMAL_ID,
    A.NAME
    FROM ANIMAL_INS A
        INNER JOIN ANIMAL_OUTS B
        ON A.ANIMAL_ID = B.ANIMAL_ID
            WHERE B.DATETIME - A.DATETIME < 0
    ORDER BY A.DATETIME;

-- 오랜 기간 보호한 동물(2)
SELECT
    A.NAME,
    A.DATETIME
    FROM ANIMAL_INS A
        LEFT JOIN ANIMAL_OUTS B
        ON A.ANIMAL_ID = B.ANIMAL_ID
            WHERE B.DATETIME IS NULL
    ORDER BY A.DATETIME
    LIMIT 3;

-- 보호소에서 중성화한 동물
SELECT
    A.ANIMAL_ID,
    A.ANIMAL_TYPE,
    A.NAME
    FROM ANIMAL_INS A
        INNER JOIN ANIMAL_OUTS B
        ON A.ANIMAL_ID = B.ANIMAL_ID
            WHERE A.SEX_UPON_INTAKE != B.SEX_UPON_OUTCOME
    ORDER BY A.ANIMAL_ID;

