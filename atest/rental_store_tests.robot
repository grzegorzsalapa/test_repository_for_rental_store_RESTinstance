*** Settings ***
Library         REST    http://127.0.0.1:8080


*** Test Cases ***
POST to create a new customer
    POST        /customers/add
    Integer     response status                 201
    Integer     response body id
    Array       response body rentals
    Output      response

POST to create a new film
    POST        /films/add                      ${CURDIR}/film_1.json
    Integer     response status                 201
    Integer     response body id
    String      response body title             "IT"
    String      response body type              "Old"
    Integer     response body items_total       5
    Integer     response body available_items   5
    Output      response

POST to rent film by customer
    POST        /films/rent                     ${CURDIR}/rent_request_1.json
    Integer     response status                 200
    Output      response

GET customer to check their Rentals
    GET         /customers/0
    Integer     response status                 200
    Array       response body rentals
    Output      response

POST to return film rented by customer
    POST        /films/return                   ${CURDIR}/return_request_1.json
    Integer     response status                 200
    Output      response