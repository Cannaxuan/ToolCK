function dateRange(start_time :: Real, end_time :: Real)
    #=
        This function is used to return the dateRange between start_time and end_time with step of one month
        Input:
            TestMonth = 199301
            MonthsInBetween = 201808
        Output:
            dateRangeArray
        by Caesar
    =#

    year, month = fldmod(start_time, 100)
    start_time = Date(year, month)
    year, month = fldmod(end_time, 100)
    end_time = Date(year, month)
    dateRange = start_time : Dates.Month(1) : end_time
    dateRangeArray = [Dates.year(i) * 100 + Dates.month(i) for i in dateRange]

    return dateRangeArray

end
