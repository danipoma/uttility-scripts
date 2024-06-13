DROP FUNCTION IF EXISTS dbo.[fn_AddBusinessDays];
GO

CREATE FUNCTION dbo.[fn_AddBusinessDays] (
    @InputDate DATE,
    @BusinessDaysToAdd INT
)
RETURNS DATE
AS
BEGIN
    DECLARE @Sign INT;
    DECLARE @Weekday INT;
    DECLARE @NormalizedDate DATE;
    DECLARE @TotalDays INT;
    DECLARE @DaysToAdd INT;
    DECLARE @FullWeeks INT;
    DECLARE @ExtraDays INT;

    -- If no business days to add, return the input date
    IF @BusinessDaysToAdd = 0
    BEGIN
        RETURN @InputDate;
    END

    -- Determine the direction of the addition
    SET @Sign = CASE WHEN @BusinessDaysToAdd >= 0 THEN 1 ELSE -1 END;
    SET @TotalDays = ABS(@BusinessDaysToAdd);

    -- Determine the weekday of the input date and normalize it to a business day
    SET @Weekday = DATEPART(WEEKDAY, @InputDate);

    -- Normalize the date to the nearest business day
    IF @Sign = 1
    BEGIN
        IF @Weekday = 7
        BEGIN
            SET @NormalizedDate = DATEADD(DAY, 2, @InputDate);
            SET @TotalDays = @TotalDays - 1
        END
        ELSE IF @Weekday = 1
        BEGIN
            SET @NormalizedDate = DATEADD(DAY, 1, @InputDate);
            SET @TotalDays = @TotalDays - 1
        END
        ELSE
        BEGIN
            SET @NormalizedDate = @InputDate;
        END
    END
    ELSE
    BEGIN
        IF @Weekday = 7
        BEGIN
            SET @NormalizedDate = DATEADD(DAY, -1, @InputDate);
            SET @TotalDays = @TotalDays - 1
        END
        ELSE IF @Weekday = 1
        BEGIN
            SET @NormalizedDate = DATEADD(DAY, -2, @InputDate);
            SET @TotalDays = @TotalDays - 1
        END
        ELSE
        BEGIN
            SET @NormalizedDate = @InputDate;
        END
    END

    -- Determine the weekday of the normalized date
    SET @Weekday = DATEPART(WEEKDAY, @NormalizedDate);

    -- Normalize the weekend numbering
    SET @Weekday = (@Weekday + @@DATEFIRST - 1) % 7

    -- Calculate full weeks and remaining extra days
    SET @FullWeeks = @TotalDays / 5;
    SET @ExtraDays = @TotalDays % 5;

    -- Calculate the total days to add, considering weekends
    SET @DaysToAdd = @FullWeeks * 7 + @ExtraDays;

    -- Adjust for weekends if extra days spill over
    IF @Sign = 1
    BEGIN
        IF @Weekday + @ExtraDays > 5
        BEGIN
            SET @DaysToAdd = @DaysToAdd + 2;
        END
    END
    ELSE
    BEGIN
        IF @Weekday - @ExtraDays < 1
        BEGIN
            SET @DaysToAdd = @DaysToAdd + 2;
        END
    END

    -- Calculate the adjusted date
    RETURN DATEADD(DAY, @Sign * @DaysToAdd, @NormalizedDate);
END;
GO