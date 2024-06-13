WITH TestCaseTable AS
(
SELECT *,
COUNT(Result) OVER() AS NumberOfTests,
SUM(IIF(Result = 'Passed', 1, 0)) OVER() AS PassedTests,
SUM(IIF(Result = 'Failed', 1, 0)) OVER() AS FailedTests
FROM
(
    SELECT 'T1' AS [Test], 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -50) = '2024-04-08', 'Passed', 'Failed') AS [Result], 
           dbo.[fn_AddBusinessDays]('2024-06-15', -50) AS [Actual], 
           '2024-04-08' AS [Expected]
    UNION ALL
    SELECT 'T2', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -49) = '2024-04-09', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -49), 
           '2024-04-09'
    UNION ALL
    SELECT 'T3', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -48) = '2024-04-10', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -48), 
           '2024-04-10'
    UNION ALL
    SELECT 'T4', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -47) = '2024-04-11', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -47), 
           '2024-04-11'
    UNION ALL
    SELECT 'T5', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -46) = '2024-04-12', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -46), 
           '2024-04-12'
    UNION ALL
    SELECT 'T6', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -45) = '2024-04-15', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -45), 
           '2024-04-15'
    UNION ALL
    SELECT 'T7', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -44) = '2024-04-16', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -44), 
           '2024-04-16'
    UNION ALL
    SELECT 'T8', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -43) = '2024-04-17', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -43), 
           '2024-04-17'
    UNION ALL
    SELECT 'T9', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -42) = '2024-04-18', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -42), 
           '2024-04-18'
    UNION ALL
    SELECT 'T10', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -41) = '2024-04-19', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -41), 
           '2024-04-19'
    UNION ALL
    SELECT 'T11', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -40) = '2024-04-22', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -40), 
           '2024-04-22'
    UNION ALL
    SELECT 'T12', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -39) = '2024-04-23', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -39), 
           '2024-04-23'
    UNION ALL
    SELECT 'T13', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -38) = '2024-04-24', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -38), 
           '2024-04-24'
    UNION ALL
    SELECT 'T14', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -37) = '2024-04-25', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -37), 
           '2024-04-25'
    UNION ALL
    SELECT 'T15', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -36) = '2024-04-26', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -36), 
           '2024-04-26'
    UNION ALL
    SELECT 'T16', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -35) = '2024-04-29', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -35), 
           '2024-04-29'
    UNION ALL
    SELECT 'T17', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -34) = '2024-04-30', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -34), 
           '2024-04-30'
    UNION ALL
    SELECT 'T18', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -33) = '2024-05-01', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -33), 
           '2024-05-01'
    UNION ALL
    SELECT 'T19', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -32) = '2024-05-02', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -32), 
           '2024-05-02'
    UNION ALL
    SELECT 'T20', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -31) = '2024-05-03', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -31), 
           '2024-05-03'
    UNION ALL
    SELECT 'T21', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -30) = '2024-05-06', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -30), 
           '2024-05-06'
    UNION ALL
    SELECT 'T22', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -29) = '2024-05-07', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -29), 
           '2024-05-07'
    UNION ALL
    SELECT 'T23', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -28) = '2024-05-08', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -28), 
           '2024-05-08'
    UNION ALL
    SELECT 'T24', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -27) = '2024-05-09', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -27), 
           '2024-05-09'
    UNION ALL
    SELECT 'T25', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -26) = '2024-05-10', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -26), 
           '2024-05-10'
    UNION ALL
    SELECT 'T26', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -25) = '2024-05-13', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -25), 
           '2024-05-13'
    UNION ALL
    SELECT 'T27', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -24) = '2024-05-14', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -24), 
           '2024-05-14'
    UNION ALL
    SELECT 'T28', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -23) = '2024-05-15', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -23), 
           '2024-05-15'
    UNION ALL
    SELECT 'T29', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -22) = '2024-05-16', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -22), 
           '2024-05-16'
    UNION ALL
    SELECT 'T30', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -21) = '2024-05-17', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -21), 
           '2024-05-17'
    UNION ALL
    SELECT 'T31', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -20) = '2024-05-20', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -20), 
           '2024-05-20'
    UNION ALL
    SELECT 'T32', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -19) = '2024-05-21', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -19), 
           '2024-05-21'
    UNION ALL
    SELECT 'T33', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -18) = '2024-05-22', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -18), 
           '2024-05-22'
    UNION ALL
    SELECT 'T34', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -17) = '2024-05-23', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -17), 
           '2024-05-23'
    UNION ALL
    SELECT 'T35', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -16) = '2024-05-24', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -16), 
           '2024-05-24'
    UNION ALL
    SELECT 'T36', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -15) = '2024-05-27', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -15), 
           '2024-05-27'
    UNION ALL
    SELECT 'T37', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -14) = '2024-05-28', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -14), 
           '2024-05-28'
    UNION ALL
    SELECT 'T38', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -13) = '2024-05-29', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -13), 
           '2024-05-29'
    UNION ALL
    SELECT 'T39', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -12) = '2024-05-30', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -12), 
           '2024-05-30'
    UNION ALL
    SELECT 'T40', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -11) = '2024-05-31', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -11), 
           '2024-05-31'
    UNION ALL
    SELECT 'T41', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -10) = '2024-06-03', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -10), 
           '2024-06-03'
    UNION ALL
    SELECT 'T42', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -9) = '2024-06-04', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -9), 
           '2024-06-04'
    UNION ALL
    SELECT 'T43', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -8) = '2024-06-05', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -8), 
           '2024-06-05'
    UNION ALL
    SELECT 'T44', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -7) = '2024-06-06', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -7), 
           '2024-06-06'
    UNION ALL
    SELECT 'T45', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -6) = '2024-06-07', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -6), 
           '2024-06-07'
    UNION ALL
    SELECT 'T46', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -5) = '2024-06-10', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -5), 
           '2024-06-10'
    UNION ALL
    SELECT 'T47', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -4) = '2024-06-11', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -4), 
           '2024-06-11'
    UNION ALL
    SELECT 'T48', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -3) = '2024-06-12', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -3), 
           '2024-06-12'
    UNION ALL
    SELECT 'T49', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -2) = '2024-06-13', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -2), 
           '2024-06-13'
    UNION ALL
    SELECT 'T50', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', -1) = '2024-06-14', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', -1), 
           '2024-06-14'
    UNION ALL
    SELECT 'T51', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 0) = '2024-06-15', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 0), 
           '2024-06-15'
    UNION ALL
    SELECT 'T52', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 1) = '2024-06-17', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 1), 
           '2024-06-17'
    UNION ALL
    SELECT 'T53', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 2) = '2024-06-18', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 2), 
           '2024-06-18'
    UNION ALL
    SELECT 'T54', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 3) = '2024-06-19', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 3), 
           '2024-06-19'
    UNION ALL
    SELECT 'T55', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 4) = '2024-06-20', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 4), 
           '2024-06-20'
    UNION ALL
    SELECT 'T56', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 5) = '2024-06-21', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 5), 
           '2024-06-21'
    UNION ALL
    SELECT 'T57', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 6) = '2024-06-24', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 6), 
           '2024-06-24'
    UNION ALL
    SELECT 'T58', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 7) = '2024-06-25', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 7), 
           '2024-06-25'
    UNION ALL
    SELECT 'T59', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 8) = '2024-06-26', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 8), 
           '2024-06-26'
    UNION ALL
    SELECT 'T60', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 9) = '2024-06-27', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 9), 
           '2024-06-27'
    UNION ALL
    SELECT 'T61', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 10) = '2024-06-28', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 10), 
           '2024-06-28'
    UNION ALL
    SELECT 'T62', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 11) = '2024-07-01', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 11), 
           '2024-07-01'
    UNION ALL
    SELECT 'T63', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 12) = '2024-07-02', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 12), 
           '2024-07-02'
    UNION ALL
    SELECT 'T64', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 13) = '2024-07-03', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 13), 
           '2024-07-03'
    UNION ALL
    SELECT 'T65', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 14) = '2024-07-04', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 14), 
           '2024-07-04'
    UNION ALL
    SELECT 'T66', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 15) = '2024-07-05', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 15), 
           '2024-07-05'
    UNION ALL
    SELECT 'T67', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 16) = '2024-07-08', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 16), 
           '2024-07-08'
    UNION ALL
    SELECT 'T68', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 17) = '2024-07-09', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 17), 
           '2024-07-09'
    UNION ALL
    SELECT 'T69', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 18) = '2024-07-10', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 18), 
           '2024-07-10'
    UNION ALL
    SELECT 'T70', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 19) = '2024-07-11', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 19), 
           '2024-07-11'
    UNION ALL
    SELECT 'T71', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 20) = '2024-07-12', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 20), 
           '2024-07-12'
    UNION ALL
    SELECT 'T72', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 21) = '2024-07-15', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 21), 
           '2024-07-15'
    UNION ALL
    SELECT 'T73', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 22) = '2024-07-16', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 22), 
           '2024-07-16'
    UNION ALL
    SELECT 'T74', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 23) = '2024-07-17', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 23), 
           '2024-07-17'
    UNION ALL
    SELECT 'T75', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 24) = '2024-07-18', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 24), 
           '2024-07-18'
    UNION ALL
    SELECT 'T76', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 25) = '2024-07-19', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 25), 
           '2024-07-19'
    UNION ALL
    SELECT 'T77', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 26) = '2024-07-22', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 26), 
           '2024-07-22'
    UNION ALL
    SELECT 'T78', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 27) = '2024-07-23', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 27), 
           '2024-07-23'
    UNION ALL
    SELECT 'T79', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 28) = '2024-07-24', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 28), 
           '2024-07-24'
    UNION ALL
    SELECT 'T80', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 29) = '2024-07-25', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 29), 
           '2024-07-25'
    UNION ALL
    SELECT 'T81' AS [Test], 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 30) = '2024-07-26', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 30), 
           '2024-07-26'
    UNION ALL
    SELECT 'T82', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 31) = '2024-07-29', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 31), 
           '2024-07-29'
    UNION ALL
    SELECT 'T83', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 32) = '2024-07-30', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 32), 
           '2024-07-30'
    UNION ALL
    SELECT 'T84', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 33) = '2024-07-31', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 33), 
           '2024-07-31'
    UNION ALL
    SELECT 'T85', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 34) = '2024-08-01', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 34), 
           '2024-08-01'
    UNION ALL
    SELECT 'T86', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 35) = '2024-08-02', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 35), 
           '2024-08-02'
    UNION ALL
    SELECT 'T87', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 36) = '2024-08-05', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 36), 
           '2024-08-05'
    UNION ALL
    SELECT 'T88', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 37) = '2024-08-06', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 37), 
           '2024-08-06'
    UNION ALL
    SELECT 'T89', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 38) = '2024-08-07', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 38), 
           '2024-08-07'
    UNION ALL
    SELECT 'T90', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 39) = '2024-08-08', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 39), 
           '2024-08-08'
    UNION ALL
    SELECT 'T91', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 40) = '2024-08-09', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 40), 
           '2024-08-09'
    UNION ALL
    SELECT 'T92', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 41) = '2024-08-12', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 41), 
           '2024-08-12'
    UNION ALL
    SELECT 'T93', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 42) = '2024-08-13', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 42), 
           '2024-08-13'
    UNION ALL
    SELECT 'T94', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 43) = '2024-08-14', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 43), 
           '2024-08-14'
    UNION ALL
    SELECT 'T95', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 44) = '2024-08-15', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 44), 
           '2024-08-15'
    UNION ALL
    SELECT 'T96', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 45) = '2024-08-16', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 45), 
           '2024-08-16'
    UNION ALL
    SELECT 'T97', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 46) = '2024-08-19', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 46), 
           '2024-08-19'
    UNION ALL
    SELECT 'T98', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 47) = '2024-08-20', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 47), 
           '2024-08-20'
    UNION ALL
    SELECT 'T99', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 48) = '2024-08-21', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 48), 
           '2024-08-21'
    UNION ALL
    SELECT 'T100', 
           IIF(dbo.[fn_AddBusinessDays]('2024-06-15', 49) = '2024-08-22', 'Passed', 'Failed'), 
           dbo.[fn_AddBusinessDays]('2024-06-15', 49), 
           '2024-08-22'
) AS t1)
SELECT *
FROM TestCaseTable