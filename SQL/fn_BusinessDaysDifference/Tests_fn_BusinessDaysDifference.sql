WITH TestCaseTable AS
(
SELECT *,
COUNT(Result) OVER() AS NumberOfTests,
SUM(IIF(Result = 'Passed', 1, 0)) OVER() AS PassedTests,
SUM(IIF(Result = 'Failed', 1, 0)) OVER() AS FailedTests
FROM
(
    SELECT 'T1' AS [Test], 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-06-13', '2024-06-13') = 0, 'Passed', 'Failed') AS [Result], 
           dbo.[fn_BusinessDaysDifference]('2024-06-13', '2024-06-13') AS [Actual], 
           0 AS [Expected]
    UNION ALL
    SELECT 'T2', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-08-20', '2025-11-05') = -206, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-08-20', '2025-11-05'), 
           -206
    UNION ALL
    SELECT 'T3', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-09-24', '2026-08-27') = 502, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-09-24', '2026-08-27'), 
           502
    UNION ALL
    SELECT 'T4', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-08-31', '2025-01-06') = -169, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-08-31', '2025-01-06'), 
           -169
    UNION ALL
    SELECT 'T5', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-06-01', '2026-08-29') = 64, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-06-01', '2026-08-29'), 
           64
    UNION ALL
    SELECT 'T6', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-01-12', '2027-02-17') = 287, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-01-12', '2027-02-17'), 
           287
    UNION ALL
    SELECT 'T7', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-02-02', '2025-09-22') = 165, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-02-02', '2025-09-22'), 
           165
    UNION ALL
    SELECT 'T8', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-01-19', '2024-10-28') = -320, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-01-19', '2024-10-28'), 
           -320
    UNION ALL
    SELECT 'T9', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-12-14', '2026-04-13') = -175, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-12-14', '2026-04-13'), 
           -175
    UNION ALL
    SELECT 'T10', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-09-25', '2024-08-25') = -283, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-09-25', '2024-08-25'), 
           -283
    UNION ALL
    SELECT 'T11', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-11-03', '2026-07-17') = 184, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-11-03', '2026-07-17'), 
           184
    UNION ALL
    SELECT 'T12', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-08-09', '2026-04-18') = 440, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-08-09', '2026-04-18'), 
           440
    UNION ALL
    SELECT 'T13', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-03-29', '2025-05-24') = -219, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-03-29', '2025-05-24'), 
           -219
    UNION ALL
    SELECT 'T14', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-05-30', '2026-09-23') = 82, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-05-30', '2026-09-23'), 
           82
    UNION ALL
    SELECT 'T15', 
           IIF(dbo.[fn_BusinessDaysDifference]('2027-02-07', '2024-11-26') = -573, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2027-02-07', '2024-11-26'), 
           -573
    UNION ALL
    SELECT 'T16', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-09-20', '2025-12-12') = -200, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-09-20', '2025-12-12'), 
           -200
    UNION ALL
    SELECT 'T17', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-04-25', '2024-09-27') = -150, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-04-25', '2024-09-27'), 
           -150
    UNION ALL
    SELECT 'T18', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-02-28', '2026-06-08') = 331, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-02-28', '2026-06-08'), 
           331
    UNION ALL
    SELECT 'T19', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-04-09', '2025-03-31') = -7, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-04-09', '2025-03-31'), 
           -7
    UNION ALL
    SELECT 'T20', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-09-09', '2026-10-20') = 29, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-09-09', '2026-10-20'), 
           29
    UNION ALL
    SELECT 'T21', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-06-24', '2026-07-18') = 17, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-06-24', '2026-07-18'), 
           17
    UNION ALL
    SELECT 'T22', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-08-05', '2024-09-26') = -484, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-08-05', '2024-09-26'), 
           -484
    UNION ALL
    SELECT 'T23', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-12-17', '2026-09-20') = 197, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-12-17', '2026-09-20'), 
           197
    UNION ALL
    SELECT 'T24', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-09-18', '2024-07-17') = -45, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-09-18', '2024-07-17'), 
           -45
    UNION ALL
    SELECT 'T25', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-08-08', '2025-02-02') = -394, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-08-08', '2025-02-02'), 
           -394
    UNION ALL
    SELECT 'T26', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-03-17', '2026-02-09') = -26, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-03-17', '2026-02-09'), 
           -26
    UNION ALL
    SELECT 'T27', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-09-14', '2026-11-26') = 313, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-09-14', '2026-11-26'), 
           313
    UNION ALL
    SELECT 'T28', 
           IIF(dbo.[fn_BusinessDaysDifference]('2027-02-09', '2026-05-24') = -186, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2027-02-09', '2026-05-24'), 
           -186
    UNION ALL
    SELECT 'T29', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-06-04', '2025-06-20') = -249, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-06-04', '2025-06-20'), 
           -249
    UNION ALL
    SELECT 'T30', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-02-04', '2026-07-28') = 385, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-02-04', '2026-07-28'), 
           385
    UNION ALL
    SELECT 'T31', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-11-20', '2024-11-16') = -524, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-11-20', '2024-11-16'), 
           -524
    UNION ALL
    SELECT 'T32', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-03-12', '2026-01-28') = 230, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-03-12', '2026-01-28'), 
           230
    UNION ALL
    SELECT 'T33', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-01-16', '2025-12-30') = 248, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-01-16', '2025-12-30'), 
           248
    UNION ALL
    SELECT 'T34', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-10-20', '2024-12-24') = -475, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-10-20', '2024-12-24'), 
           -475
    UNION ALL
    SELECT 'T35', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-08-12', '2025-01-09') = 108, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-08-12', '2025-01-09'), 
           108
    UNION ALL
    SELECT 'T36', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-06-24', '2026-12-30') = 396, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-06-24', '2026-12-30'), 
           396
    UNION ALL
    SELECT 'T37', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-02-13', '2024-08-29') = -120, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-02-13', '2024-08-29'), 
           -120
    UNION ALL
    SELECT 'T38', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-08-11', '2024-09-14') = 24, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-08-11', '2024-09-14'), 
           24
    UNION ALL
    SELECT 'T39', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-10-01', '2025-05-09') = 158, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-10-01', '2025-05-09'), 
           158
    UNION ALL
    SELECT 'T40', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-04-11', '2026-05-17') = 285, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-04-11', '2026-05-17'), 
           285
    UNION ALL
    SELECT 'T41', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-12-04', '2026-11-18') = 510, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-12-04', '2026-11-18'), 
           510
    UNION ALL
    SELECT 'T42', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-12-28', '2025-01-24') = -240, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-12-28', '2025-01-24'), 
           -240
    UNION ALL
    SELECT 'T43', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-10-26', '2026-03-15') = 99, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-10-26', '2026-03-15'), 
           99
    UNION ALL
    SELECT 'T44', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-07-10', '2025-09-01') = -224, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-07-10', '2025-09-01'), 
           -224
    UNION ALL
    SELECT 'T45', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-11-07', '2026-05-19') = 137, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-11-07', '2026-05-19'), 
           137
    UNION ALL
    SELECT 'T46', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-02-21', '2024-08-06') = -143, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-02-21', '2024-08-06'), 
           -143
    UNION ALL
    SELECT 'T47', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-12-30', '2026-06-05') = 113, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-12-30', '2026-06-05'), 
           113
    UNION ALL
    SELECT 'T48', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-07-12', '2025-10-19') = 69, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-07-12', '2025-10-19'), 
           69
    UNION ALL
    SELECT 'T49', 
           IIF(dbo.[fn_BusinessDaysDifference]('2027-02-04', '2025-03-22') = -488, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2027-02-04', '2025-03-22'), 
           -488
    UNION ALL
    SELECT 'T50', 
           IIF(dbo.[fn_BusinessDaysDifference]('2027-02-19', '2026-01-13') = -288, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2027-02-19', '2026-01-13'), 
           -288
    UNION ALL
    SELECT 'T51', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-01-03', '2025-05-28') = 103, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-01-03', '2025-05-28'), 
           103
    UNION ALL
    SELECT 'T52', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-11-24', '2024-12-19') = 18, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-11-24', '2024-12-19'), 
           18
    UNION ALL
    SELECT 'T53', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-12-20', '2026-04-03') = 74, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-12-20', '2026-04-03'), 
           74
    UNION ALL
    SELECT 'T54', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-04-14', '2025-12-28') = 184, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-04-14', '2025-12-28'), 
           184
    UNION ALL
    SELECT 'T55', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-11-08', '2026-01-29') = -201, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-11-08', '2026-01-29'), 
           -201
    UNION ALL
    SELECT 'T56', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-01-27', '2025-02-26') = -239, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-01-27', '2025-02-26'), 
           -239
    UNION ALL
    SELECT 'T57', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-01-13', '2026-09-21') = 179, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-01-13', '2026-09-21'), 
           179
    UNION ALL
    SELECT 'T58', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-06-22', '2026-02-13') = 429, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-06-22', '2026-02-13'), 
           429
    UNION ALL
    SELECT 'T59', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-08-04', '2025-11-28') = 84, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-08-04', '2025-11-28'), 
           84
    UNION ALL
    SELECT 'T60', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-09-03', '2026-12-24') = 602, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-09-03', '2026-12-24'), 
           602
    UNION ALL
    SELECT 'T61', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-04-08', '2024-07-14') = -191, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-04-08', '2024-07-14'), 
           -191
    UNION ALL
    SELECT 'T62', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-10-03', '2025-08-02') = -44, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-10-03', '2025-08-02'), 
           -44
    UNION ALL
    SELECT 'T63', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-06-13', '2025-04-28') = 227, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-06-13', '2025-04-28'), 
           227
    UNION ALL
    SELECT 'T64', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-06-29', '2026-10-16') = 599, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-06-29', '2026-10-16'), 
           599
    UNION ALL
    SELECT 'T65', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-09-15', '2024-07-10') = -308, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-09-15', '2024-07-10'), 
           -308
    UNION ALL
    SELECT 'T66', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-07-29', '2024-08-31') = -236, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-07-29', '2024-08-31'), 
           -236
    UNION ALL
    SELECT 'T67', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-09-17', '2024-08-19') = -282, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-09-17', '2024-08-19'), 
           -282
    UNION ALL
    SELECT 'T68', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-10-19', '2026-03-13') = 364, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-10-19', '2026-03-13'), 
           364
    UNION ALL
    SELECT 'T69', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-07-17', '2025-11-17') = -174, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-07-17', '2025-11-17'), 
           -174
    UNION ALL
    SELECT 'T70', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-09-29', '2026-06-07') = -81, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-09-29', '2026-06-07'), 
           -81
    UNION ALL
    SELECT 'T71', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-05-05', '2024-10-11') = -407, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-05-05', '2024-10-11'), 
           -407
    UNION ALL
    SELECT 'T72', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-06-06', '2026-09-22') = 337, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-06-06', '2026-09-22'), 
           337
    UNION ALL
    SELECT 'T73', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-10-17', '2024-09-29') = -274, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-10-17', '2024-09-29'), 
           -274
    UNION ALL
    SELECT 'T74', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-07-10', '2025-01-26') = -118, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-07-10', '2025-01-26'), 
           -118
    UNION ALL
    SELECT 'T75', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-09-10', '2024-11-17') = -212, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-09-10', '2024-11-17'), 
           -212
    UNION ALL
    SELECT 'T76', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-09-04', '2026-10-22') = 556, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-09-04', '2026-10-22'), 
           556
    UNION ALL
    SELECT 'T77', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-03-08', '2024-06-12') = -192, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-03-08', '2024-06-12'), 
           -192
    UNION ALL
    SELECT 'T78', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-06-20', '2025-10-06') = -184, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-06-20', '2025-10-06'), 
           -184
    UNION ALL
    SELECT 'T79', 
           IIF(dbo.[fn_BusinessDaysDifference]('2027-01-08', '2027-02-01') = 16, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2027-01-08', '2027-02-01'), 
           16
    UNION ALL
    SELECT 'T80', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-05-14', '2025-12-17') = -106, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-05-14', '2025-12-17'), 
           -106
    UNION ALL
    SELECT 'T81' AS [Test], 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-04-16', '2024-10-31') = -119, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-04-16', '2024-10-31'), 
           -119
    UNION ALL
    SELECT 'T82', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-01-12', '2025-01-20') = 5, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-01-12', '2025-01-20'), 
           5
    UNION ALL
    SELECT 'T83', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-04-10', '2024-07-11') = -195, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-04-10', '2024-07-11'), 
           -195
    UNION ALL
    SELECT 'T84', 
           IIF(dbo.[fn_BusinessDaysDifference]('2027-02-27', '2025-08-27') = -392, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2027-02-27', '2025-08-27'), 
           -392
    UNION ALL
    SELECT 'T85', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-11-12', '2025-07-12') = -348, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-11-12', '2025-07-12'), 
           -348
    UNION ALL
    SELECT 'T86', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-07-14', '2025-04-03') = -72, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-07-14', '2025-04-03'), 
           -72
    UNION ALL
    SELECT 'T87', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-03-18', '2025-09-14') = 128, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-03-18', '2025-09-14'), 
           128
    UNION ALL
    SELECT 'T88', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-02-07', '2025-02-12') = 3, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-02-07', '2025-02-12'), 
           3
    UNION ALL
    SELECT 'T89', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-07-19', '2025-08-12') = -243, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-07-19', '2025-08-12'), 
           -243
    UNION ALL
    SELECT 'T90', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-06-13', '2024-10-12') = -434, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-06-13', '2024-10-12'), 
           -434
    UNION ALL
    SELECT 'T91', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-01-07', '2024-09-20') = -77, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-01-07', '2024-09-20'), 
           -77
    UNION ALL
    SELECT 'T92', 
           IIF(dbo.[fn_BusinessDaysDifference]('2027-03-06', '2025-07-09') = -432, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2027-03-06', '2025-07-09'), 
           -432
    UNION ALL
    SELECT 'T93', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-11-30', '2026-01-31') = -215, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-11-30', '2026-01-31'), 
           -215
    UNION ALL
    SELECT 'T94', 
           IIF(dbo.[fn_BusinessDaysDifference]('2025-06-07', '2024-12-05') = -131, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2025-06-07', '2024-12-05'), 
           -131
    UNION ALL
    SELECT 'T95', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-07-22', '2025-11-16') = 344, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-07-22', '2025-11-16'), 
           344
    UNION ALL
    SELECT 'T96', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-06-19', '2025-09-24') = 330, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-06-19', '2025-09-24'), 
           330
    UNION ALL
    SELECT 'T97', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-09-09', '2024-10-05') = 19, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-09-09', '2024-10-05'), 
           19
    UNION ALL
    SELECT 'T98', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-08-19', '2025-01-11') = -417, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-08-19', '2025-01-11'), 
           -417
    UNION ALL
    SELECT 'T99', 
           IIF(dbo.[fn_BusinessDaysDifference]('2026-01-14', '2024-09-03') = -356, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2026-01-14', '2024-09-03'), 
           -356
    UNION ALL
    SELECT 'T100', 
           IIF(dbo.[fn_BusinessDaysDifference]('2024-11-04', '2026-12-14') = 550, 'Passed', 'Failed'), 
           dbo.[fn_BusinessDaysDifference]('2024-11-04', '2026-12-14'), 
           550
) AS t1)
SELECT *
FROM TestCaseTable