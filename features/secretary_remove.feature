Feature: Secretary remove
    In order to delete a secretary
    As an admin
    I want to delete a secretary

    Background:
        Given there is a secretary with name "Marcia" and password "12345678" nusp "1111111" and email "marcia@ime.usp.br"

    Scenario: Admin removing a secretary
    	Given I'm at the login page
        And there is an admin user with email "kazuo@ime.usp.br" and password "admin123"
        When I fill the "Email" field with "kazuo@ime.usp.br"
        And I fill the "Senha" field with "admin123"
        And I press the "Entrar" button
        And I click the "Funcionários" link
        And I click the "Marcia" link
        And I click the "Remover" link
        And I should not see "Marcia"
        And I should not see "marcia@ime.usp.br"

    Scenario: Professor cannot remove a secretary
        Given I'm at the professor login page
        And there is a professor with name "arnaldo" and password "12345678" nusp "1111111" department "MAC" and email "kira@usp.br"
        When I fill the "Número USP" field with "1111111"
        And I fill the "Senha" field with "12345678"
        And I press the "Entrar" button
        And I click the "Funcionários" link
        And I click the "Marcia" link
        And I should not see "Remover"

    Scenario: Any person trying to remove a secretary
        Given I'm at the "secretaries" page
		Then I should see "Acesso negado"
