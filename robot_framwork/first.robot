*** Settings ***
# Library built-in

*** Test Cases ***
MyFirstTest
    Log     Hello World!!! level=INFO

AdditionTest
    ${result}    Evaluate    int(2+3)
    # Should Be Equal As Integers    ${result}  5    
    Should Be Equal    ${result}    int(5)

