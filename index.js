require("dotenv").config({
  path: ".env",
})

const express = require("express")
const app = express()
app.use(express.json({limit: "10mb", extended: true}))
app.use(express.urlencoded({limit: "10mb", extended: true, parameterLimit: 50000}))
app.use("/uploads", express.static("uploads"))
const PORT = process.env.PORT

const cors = require("cors")

app.use(
  cors({
    origin: process.env.CORS,
    optionsSuccessStatus: 200,
  })
)

app.use("/", require("./src/routers/index"))

app.listen(PORT, () => {
  console.log(`App is listening on ${PORT}`)
})
