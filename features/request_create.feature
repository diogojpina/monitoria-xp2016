Feature: Creating Request for Teaching Assistant
    In order to create requests for teaching assistant
    As a professor
    I want to create requests for teaching assistants

    Background:
        Given I'm at the professor login page
        And there is a department with code "MAC"
        And there is a professor with name "Bob" and password "prof-123" nusp "123" department "MAC" and email "bob@bob.bob"
        And there is a course with name "Mascarenhas" and code "MAC0300" and department "MAC"
        When I fill the "Número USP" field with "123"
        And I fill the "Senha" field with "prof-123"
        And I press the "Entrar" button
        And I should see "Pedidos de Monitoria"
        And I click the "Pedidos de Monitoria" link
        And I should see "Novo pedido por monitor"
        And I click the "Novo pedido por monitor" link
        

    Scenario: Valid professor creating a new request
        Then I should see "Novo Pedido por Monitor"
        And I select "MAC0300 - Mascarenhas" on the "Disciplina"
        And I fill the "Número de monitores solicitados" field with "2"
        And I select the priority option "Extremamente necessário, mas não imprescindível"
        And I mark the "Correção de trabalhos" checkbox
        And I mark the "Fiscalização de provas" checkbox
        And I write on the "Observações" text area "teste observações"
        And I press the "Enviar" button
        Then I should see "Pedido de Monitoria feito com sucesso"
        And I should see "Disciplina: MAC0300 - Mascarenhas"
        And I should see "Número de monitores solicitados: 2"
        And I should see "Prioridade: Extremamente necessário, mas não imprescindível"
        And I should see "Atendimento aos alunos: Não"
        And I should see "Correção de trabalhos: Sim"
        And I should see "Fiscalização de provas: Sim"
        And I should see "Observações: teste observações"
    
    Scenario: Invalid Course
        When I fill the "Número de monitores solicitados" field with "2"
        And I select the priority option "Extremamente necessário, mas não imprescindível"
        And I press the "Enviar" button
        Then I should see "Disciplina não pode ficar em branco"
    
    
    Scenario: Empty number of teaching assistants
        When I select "MAC0300 - Mascarenhas" on the "Disciplina"
        And I select the priority option "Extremamente necessário, mas não imprescindível"
        And I press the "Enviar" button
        Then I should see "Número de monitores solicitados não pode ficar em branco"
    
    Scenario: Zero or less teaching assistants
        When I select "MAC0300 - Mascarenhas" on the "Disciplina"
        And I fill the "Número de monitores solicitados" field with "0"
        And I select the priority option "Extremamente necessário, mas não imprescindível"
        And I press the "Enviar" button
        Then I should see "Número de monitores solicitados não está incluído na lista"
        And I fill the "Número de monitores solicitados" field with "-2"
        And I press the "Enviar" button
        And I should see "Número de monitores solicitados não está incluído na lista"

    Scenario: Without priority
        When I select "MAC0300 - Mascarenhas" on the "Disciplina"
        And I fill the "Número de monitores solicitados" field with "3"
        And I press the "Enviar" button
        Then I should see "Prioridade"

