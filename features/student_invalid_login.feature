Feature: Invalid student login
    In order to test the student login
    As a student
    I want to fail the login

    Background:
        Given I'm at the student login page
        And there is a student with name "carlinhos" and password "12345678" and nusp "123456" and gender "1" and rg "123" and cpf "321" and address "matao" and district "butanta" and zipcode "000" and city "sp" and state "sp" and tel "0123456789" and cel "1234567890" and email "eu@usp.br" and has_bank_account "true"
    

    Scenario: Invalid nusp
        When I fill the "Número USP" field with "123457"
        And I fill the "Senha" field with "12345678"
        And I press the "Entrar" button
        Then I should see "Credenciais inválidas."

    Scenario: Invalid passowrd
        When I fill the "Número USP" field with "123456"
        And I fill the "Senha" field with "12345679"
        And I press the "Entrar" button
        Then I should see "Credenciais inválidas."
