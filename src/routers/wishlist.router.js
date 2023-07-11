const wishlistRouter = require("express").Router()
const wishlistController = require("../controllers/wishlist.controller")
const validate = require("../middlewares/validator.middleware")

wishlistRouter.get("/all", validate("getOne"), wishlistController.getAllWishlist)
wishlistRouter.post("/", validate("manageWishlist"), wishlistController.makeWishlist)
wishlistRouter.get("/:id", validate("getOne"), wishlistController.getWishlist)
wishlistRouter.delete("/:id", validate("Delete"), wishlistController.deleteWishlist)

module.exports = wishlistRouter
