const { Pool } = require("pg")

const db = new Pool({
  connectionString: process.env.DATABASE,
})

db.connect()
  .then(() => {
    console.log("Database connected")
  })
  .catch(() => {
    console.log("Failed connected")
  })

module.exports = db
