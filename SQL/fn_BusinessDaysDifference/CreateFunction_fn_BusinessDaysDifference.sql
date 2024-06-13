DROP FUNCTION IF EXISTS dbo.[fn_BusinessDaysDifference];

GO

CREATE FUNCTION dbo.[fn_BusinessDaysDifference] (
    @StartDate DATE,
    @EndDate DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @BusinessDays INT;
    DECLARE @TotalDays INT;
    DECLARE @FullWeeks INT;
    DECLARE @RemainingDays INT;
    DECLARE @StartDay INT;
    DECLARE @EndDay INT;
    DECLARE @TempDate DATE;
    DECLARE @IsSwapped BIT;

    -- Return early if dates are same
    IF @StartDate = @EndDate
    BEGIN
        RETURN 0
    END

    -- Initialize IsSwapped
    SET @IsSwapped = 0;

    -- Swap dates if EndDate is older than StartDate
    IF @EndDate < @StartDate
    BEGIN
        SET @TempDate = @StartDate;
        SET @StartDate = @EndDate;
        SET @EndDate = @TempDate;
        SET @IsSwapped = 1;
    END

    -- Calculate the total number of days between the dates
    SET @TotalDays = DATEDIFF(DAY, @StartDate, @EndDate) + 1;
    SET @FullWeeks = @TotalDays / 7;
    SET @RemainingDays = @TotalDays % 7;

    -- Calculate the number of business days assuming no weekends
    SET @BusinessDays = @TotalDays;

    -- Subtract two weekend days for every full week
    SET @BusinessDays = @BusinessDays - (@FullWeeks * 2);

    -- Handle the remaining days for weekends
    SET @StartDay = DATEPART(WEEKDAY, @StartDate);
    SET @EndDay = DATEPART(WEEKDAY, @EndDate);

    -- Adjust the start and end day of the week
    SET @StartDay = (@StartDay + @@DATEFIRST - 1) % 7;
    SET @EndDay = (@EndDay + @@DATEFIRST - 1) % 7;

    -- Special case: remaining days span a weekend
    IF @RemainingDays > 0
    BEGIN
        IF @StartDay <= @EndDay
        BEGIN
            IF @StartDay = 0 AND @EndDay != 6
            BEGIN
                SET @BusinessDays = @BusinessDays - 1;
            END
            ELSE IF @EndDay = 6 AND @StartDay != 0
            BEGIN
                SET @BusinessDays = @BusinessDays - 1;
            END
        END
        ELSE
        BEGIN
            -- StartDay is greater than EndDay and spans a weekend
            SET @BusinessDays = @BusinessDays - 2;
        END
    END

    -- Adjust result to not count in starting date as additional day
    IF @BusinessDays > 0
    BEGIN
        SET @BusinessDays = @BusinessDays - 1
    END

    -- Adjust the sign of BusinessDays if dates were swapped
    IF @IsSwapped = 1
    BEGIN
        SET @BusinessDays = -@BusinessDays;
    END

    RETURN @BusinessDays;
END

GO