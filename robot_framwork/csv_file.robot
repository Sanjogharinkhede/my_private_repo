*** Settings ***
Library    CSVLibrary
 
*** Test Cases ***
Read and Print CSV Data
    ${data}    Read Csv File To Associative    testdata.csv  
    FOR    ${row}    IN    @{data}
        Log To Console    Name: ${row}[name], Age: ${row}[age], City: ${row}[city]
    END
 