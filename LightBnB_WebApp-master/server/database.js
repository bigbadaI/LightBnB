const properties = require('./json/properties.json');
const users = require('./json/users.json');
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  return pool.query(`SELECT *
  FROM users
  WHERE email = $1`, [email]).then(res => res.rows[0]);
  
};
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  return pool.query(`SELECT *
  FROM users
  WHERE id = $1`, [id]).then(res => res.rows[0]);
};
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser = function(user) {
  return pool.query(`INSERT INTO users (name, email, password)
  VALUES ($1, $2, $3)
  RETURNING *;`,[user.name, user.email, user.password]).then(res => res.columns);
    

};
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  return pool.query(`SELECT properties.id, properties.title, properties.cost_per_night, reservations.start_date, AVG(property_reviews.rating) AS average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  JOIN reservations ON reservation_id = reservations.id
  JOIN users ON property_reviews.guest_id = users.id
  WHERE users.id = $1
  AND reservations.end_date < now()::date
  GROUP BY properties.id, reservations.start_date
  ORDER BY start_date
  LIMIT $2;`, [guest_id, limit]).then(res => res.rows);
};
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function(options, limit = 10) {
  // 1
  const queryParams = [];
  // 2
  let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  `;

  // 3
  if (options.city) {
    queryParams.push(`%${options.city}%`);
    queryString += `WHERE city LIKE $${queryParams.length} `;
  }

  if (options.owner_id) {
    queryParams.push(`${options.owner_id}`);
    queryString += `WHERE owner_id = $${queryParams.length}`;
  }

  if (options.minimum_price_per_night) {
    if (options.city || options.minimum_rating) {
      queryParams.push(`${options.minimum_price_per_night}`);
      queryString += ` AND cost_per_night >= $${queryParams.length}`;
      console.log(queryString);
    } else {
      queryParams.push(`${options.minimum_price_per_night}`);
      queryString += `WHERE cost_per_night >= $${queryParams.length}`;
      console.log(queryString);
    }
  }

  if (options.maximum_price_per_night) {
    if (options.city || options.minimum_rating || options.minimum_price_per_night) {
      queryParams.push(`${options.maximum_price_per_night}`);
      queryString += ` AND cost_per_night <= $${queryParams.length}`;
      console.log(queryString);
    } else {
      queryParams.push(`${options.maximum_price_per_night}`);
      queryString += `WHERE cost_per_night <= $${queryParams.length}`;
      console.log(queryString);
    }
  }
  
  // 4
  // queryParams.push(limit);
  queryString += `
  GROUP BY properties.id`;

  if (options.minimum_rating) {
    queryParams.push(`${options.minimum_rating}`);
    queryString += `\n  HAVING avg(property_reviews.rating) >= $${queryParams.length}`;
  }

  queryParams.push(limit);
  queryString += `
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `;

  // 5
  console.log(queryString, queryParams);

  // 6
  return pool.query(queryString, queryParams)
    .then(res => res.rows);
};
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
};
exports.addProperty = addProperty;
