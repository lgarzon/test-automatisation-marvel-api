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
  Scenario: CA2 - Crear personaje nombre repetido
    Given path '/api/characters'
    And request read ('classpath:data/createCharacter.json')
    When method POST
    Then status 400
    And print response

  @id:3 @createCharacterEmpty
  Scenario: CA3 - Crear personaje campos requeridos vacíos
    Given path '/api/characters'
    And request read ('classpath:data/createCharacterEmptyRequiredFields.json')
    When method POST
    Then status 400
    And print response

  @id:4 @getAllCharacters
  Scenario: CA4 - Obtener todos los personajes
    Given path '/api/characters'
    When method GET
    Then status 200
    And print response

  @id:5 @getCharactersById
  Scenario: CA5 - Obtener personajes por ID
    Given path '/api/characters/1'
    When method GET
    Then status 200
    And print response

  @id:6 @getCharactersNotFound
  Scenario: CA5 - Obtener personajes por ID no encontrado
    Given path '/api/characters/999'
    When method GET
    Then status 404
    And print response
