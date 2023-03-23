*** Settings ***
Library         REST    http://127.0.0.1:8080


*** Test Cases ***
POST to create new user
    POST        /customers/add
    Integer     response status         201
    Integer     response body id
    Array       response body rentals
    Output      response