Feature: Test de API Marvel Character

  Background:
    * url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/lgarzona'
    * header Content-Type = 'application/json'
    * configure ssl = true

  @id:1 @createCharacter
  Scenario: CA1 - Crear un nuevo personaje
    Given path '/api/characters'
    And request read ('classpath:data/createCharacter.json')
    When method POST
    Then status 201
    And print response

  @id:2 @createCharacterDuplicate
  Scenario: CA1 - Crear personaje nombre repetido
    Given path '/api/characters'
    And request read ('classpath:data/createCharacter.json')
    When method POST
    Then status 400
    And print response

  @i:2 @createCharacterEmpty
  Scenario: CA1 - Crear personaje campos requeridos vacíos
    Given path '/api/characters'
    And request read ('classpath:data/createCharacterEmptyRequiredFields.json')
    When method POST
    Then status 400
    And print response
