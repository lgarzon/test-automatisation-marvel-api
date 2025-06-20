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
    And match response == read('classpath:data/response/characterNameExist.json')
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
  Scenario: CA6 - Obtener personajes por ID no encontrado
    Given path '/api/characters/999'
    When method GET
    Then status 404
    And match response == read('classpath:data/response/characterNotFound.json')
    And print response

  @id:7 @updateCharacters
  Scenario: CA7 - Actualizar personaje
    Given path '/api/characters/1'
    And request read ('classpath:data/createCharacter.json')
    When method PUT
    Then status 200
    And print response

  @id:8 @updateCharactersNotFound
  Scenario: CA8 - Actualizar personaje no encontrado
    Given path '/api/characters/999'
    And request read ('classpath:data/createCharacter.json')
    When method PUT
    Then status 404
    And match response == read('classpath:data/response/characterNotFound.json')
    And print response

  @id:9 @deleteCharacters
  Scenario: CA9 - Eliminar personaje
    Given path '/api/characters/4'
    When method DELETE
    Then status 204
    And print response

  @id:10 @deleteCharactersNotFound
  Scenario: CA10 - Eliminar personaje no encontrado
    Given path '/api/characters/999'
    When method DELETE
    Then status 404
    And match response == read('classpath:data/response/characterNotFound.json')
    And print response