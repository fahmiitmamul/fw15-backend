const errorHandler = require("../helpers/errorHandler.helper")
const eventsModel = require("../models/admin/events.model")
const wishlistModel = require("../models/admin/wishlist.model")

exports.getWishlist = async (req, res) => {
  try {
    let { id } = req.user

    if (!id) {
      throw Error("Unauthorized")
    }

    let wishlistData = await wishlistModel.findOne(id)
    return res.json({
      success: true,
      message: "Get wishlist successfully",
      results: wishlistData,
    })
  } catch (err) {
    return errorHandler(res, err)
  }
}

exports.makeWishlist = async (req, res) => {
  try {
    let { id } = req.user

    if (!id) {
      throw Error("Unauthorized")
    }

    const data = { ...req.body, userId: id }

    const checkEvent = await eventsModel.findOne(req.body.eventId)

    const checkWishlist = await wishlistModel.findOne(req.body.eventId)

    if (!checkEvent) {
      throw Error("Can't make wishlist because event is not found")
    }

    if (checkWishlist) {
      await wishlistModel.destroy(req.body.eventId)
    } else if (!checkWishlist) {
      await wishlistModel.insert(data)
    }

    return res.json({
      success: true,
      message: "Insert wishlist successfully",
    })
  } catch (err) {
    return errorHandler(res, err)
  }
}

exports.deleteWishlist = async (req, res) => {
  try {
    const { id } = req.user

    if (!id) {
      throw Error("Unauthorized")
    }

    const wishlistId = await wishlistModel.findOne(req.params.eventId)
    if (!wishlistId) {
      throw Error("No wishlist found")
    }

    let data = await wishlistModel.destroy(req.params.eventId)
    return res.json({
      success: true,
      message: "Delete wishlist successfully",
      results: data,
    })
  } catch (err) {
    return errorHandler(res, err)
  }
}
