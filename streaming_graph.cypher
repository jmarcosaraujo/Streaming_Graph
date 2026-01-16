// =====================================================
// PROJETO: Grafo de Serviço de Streaming
// DESCRIÇÃO: Criação de constraints e dados iniciais
// BANCO: Neo4j
// =====================================================


// =====================================================
// 1. CONSTRAINTS (UNIQUE)
// =====================================================

// Users
CREATE CONSTRAINT user_id_unique IF NOT EXISTS
FOR (u:User)
REQUIRE u.id IS UNIQUE;

// Movies
CREATE CONSTRAINT movie_id_unique IF NOT EXISTS
FOR (m:Movie)
REQUIRE m.id IS UNIQUE;

// Series
CREATE CONSTRAINT series_id_unique IF NOT EXISTS
FOR (s:Series)
REQUIRE s.id IS UNIQUE;

// Actors
CREATE CONSTRAINT actor_id_unique IF NOT EXISTS
FOR (a:Actor)
REQUIRE a.id IS UNIQUE;

// Directors
CREATE CONSTRAINT director_id_unique IF NOT EXISTS
FOR (d:Director)
REQUIRE d.id IS UNIQUE;

// Genres
CREATE CONSTRAINT genre_name_unique IF NOT EXISTS
FOR (g:Genre)
REQUIRE g.name IS UNIQUE;


// =====================================================
// 2. USERS
// =====================================================

CREATE
(:User {id: 1, name: 'Ana'}),
(:User {id: 2, name: 'Bruno'}),
(:User {id: 3, name: 'Carlos'}),
(:User {id: 4, name: 'Daniela'}),
(:User {id: 5, name: 'Eduardo'}),
(:User {id: 6, name: 'Fernanda'}),
(:User {id: 7, name: 'Gabriel'}),
(:User {id: 8, name: 'Helena'}),
(:User {id: 9, name: 'Igor'}),
(:User {id: 10, name: 'Julia'});


// =====================================================
// 3. MOVIES
// =====================================================

CREATE
(:Movie {id: 101, title: 'Matrix'}),
(:Movie {id: 102, title: 'Inception'}),
(:Movie {id: 103, title: 'Interstellar'}),
(:Movie {id: 104, title: 'John Wick'}),
(:Movie {id: 105, title: 'O Senhor dos Anéis'});


// =====================================================
// 4. SERIES
// =====================================================

CREATE
(:Series {id: 201, title: 'Breaking Bad'}),
(:Series {id: 202, title: 'Dark'}),
(:Series {id: 203, title: 'Stranger Things'}),
(:Series {id: 204, title: 'The Boys'}),
(:Series {id: 205, title: 'Game of Thrones'});


// =====================================================
// 5. ACTORS
// =====================================================

CREATE
(:Actor {id: 1, name: 'Keanu Reeves'}),
(:Actor {id: 2, name: 'Leonardo DiCaprio'}),
(:Actor {id: 3, name: 'Matthew McConaughey'}),
(:Actor {id: 4, name: 'Bryan Cranston'}),
(:Actor {id: 5, name: 'Millie Bobby Brown'});


// =====================================================
// 6. DIRECTORS
// =====================================================

CREATE
(:Director {id: 1, name: 'Lana Wachowski'}),
(:Director {id: 2, name: 'Christopher Nolan'}),
(:Director {id: 3, name: 'Peter Jackson'}),
(:Director {id: 4, name: 'Vince Gilligan'}),
(:Director {id: 5, name: 'David Benioff'});


// =====================================================
// 7. GENRES
// =====================================================

CREATE
(:Genre {name: 'Sci-Fi'}),
(:Genre {name: 'Action'}),
(:Genre {name: 'Drama'}),
(:Genre {name: 'Fantasy'}),
(:Genre {name: 'Thriller'});


// =====================================================
// 8. CONTENT RELATIONSHIPS
// =====================================================

// ACTED_IN
MATCH (a:Actor {name: 'Keanu Reeves'}), (m:Movie {title: 'Matrix'})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name: 'Leonardo DiCaprio'}), (m:Movie {title: 'Inception'})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name: 'Matthew McConaughey'}), (m:Movie {title: 'Interstellar'})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name: 'Bryan Cranston'}), (s:Series {title: 'Breaking Bad'})
CREATE (a)-[:ACTED_IN]->(s);


// DIRECTED
MATCH (d:Director {name: 'Lana Wachowski'}), (m:Movie {title: 'Matrix'})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name: 'Christopher Nolan'}), (m:Movie {title: 'Inception'})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name: 'Vince Gilligan'}), (s:Series {title: 'Breaking Bad'})
CREATE (d)-[:DIRECTED]->(s);


// IN_GENRE
MATCH (m:Movie {title: 'Matrix'}), (g:Genre {name: 'Sci-Fi'})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title: 'John Wick'}), (g:Genre {name: 'Action'})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (s:Series {title: 'Breaking Bad'}), (g:Genre {name: 'Drama'})
CREATE (s)-[:IN_GENRE]->(g);

MATCH (s:Series {title: 'Dark'}), (g:Genre {name: 'Sci-Fi'})
CREATE (s)-[:IN_GENRE]->(g);


// =====================================================
// 9. USER INTERACTIONS (WATCHED)
// =====================================================

MATCH (u:User {name: 'Ana'}), (m:Movie {title: 'Matrix'})
CREATE (u)-[:WATCHED {rating: 5}]->(m);

MATCH (u:User {name: 'Bruno'}), (s:Series {title: 'Breaking Bad'})
CREATE (u)-[:WATCHED {rating: 4.5}]->(s);

MATCH (u:User {name: 'Carlos'}), (m:Movie {title: 'Inception'})
CREATE (u)-[:WATCHED {rating: 4}]->(m);

MATCH (u:User {name: 'Daniela'}), (s:Series {title: 'Dark'})
CREATE (u)-[:WATCHED {rating: 5}]->(s);

MATCH (u:User {name: 'Eduardo'}), (m:Movie {title: 'Interstellar'})
CREATE (u)-[:WATCHED {rating: 4.8}]->(m);
