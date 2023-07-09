const errorHandler = require("../helpers/errorHandler.helper")
const eventsModel = require("../models/admin/events.model")
const eventCategoriesModel = require("../models/admin/eventcategories.model")
const admin = require("../helpers/firebase")
const deviceTokenModel = require("../models/admin/deviceToken.model")
const notificationModel = require("../models/admin/notification.model")
const fileRemover = require("../helpers/fileremover.helper")
const moment = require("moment")

exports.getAllEvents = async (req, res) => {
  try {
    let data = await eventsModel.findAll(
      req.query.page,
      req.query.limit,
      req.query.search,
      req.query.sort,
      req.query.sortBy,
      req.query.category,
      req.query.location
    )
    return res.json({
      success: true,
      message: "List of all events",
      results: data,
    })
  } catch (err) {
    return errorHandler(res, err)
  }
}

exports.getAllEventsByUserId = async (req, res) => {
  try {
    const { id: userId } = req.user
    let data = await eventsModel.findAllByUserId(
      req.query.page,
      req.query.limit,
      req.query.search,
      req.query.sort,
      req.query.sortBy,
      req.query.category,
      req.query.location,
      userId
    )
    return res.json({
      success: true,
      message: "List of all events",
      results: data,
    })
  } catch (err) {
    return errorHandler(res, err)
  }
}

exports.getEventsByParamsId = async (req, res) => {
  try {
    let data = await eventsModel.findOne(req.params.id)
    return res.json({
      success: true,
      message: "Get one events successfully",
      results: data,
    })
  } catch (err) {
    return errorHandler(res, err)
  }
}

exports.createEvent = async (req, res) => {
  try {
    if (req.file) {
      req.body.picture = req.file.filename
    }

    const { id } = req.user

    if (!id) {
      throw Error("Unauthorized")
    }

    let data = { ...req.body, createdBy: id }
    const event = await eventsModel.insert(data)
    const eventCategories = {
      eventId: event.id,
      categoryId: req.body.categoryId,
    }

    await eventCategoriesModel.insert(eventCategories)

    const messaging = admin.messaging()
    const listToken = await deviceTokenModel.findAll(1, 1000)
    const message = listToken.map((item) => ({
      token: item.token,
      notification: {
        title: "There is a new event!",
        body: `${req.body.title} will be held at ${moment(req.body.date).format("dddd LL")}, check it out !`,
      },
    }))
    messaging.sendEach(message)

    const notifData = {
      title: "There is a new event !",
      body: `${req.body.title} will be held at ${moment(req.body.date).format("dddd LL")}, check it out !`,
    }

    await notificationModel.insert(notifData)

    return res.json({
      success: true,
      message: "Created events successfully",
      results: event,
    })
  } catch (err) {
    return errorHandler(res, err)
  }
}

exports.updateEvents = async (req, res) => {
  try {
    if (req.file) {
      req.body.picture = req.file.filename
    }
    const { id } = req.user
    if (!id) {
      throw Error("Unauthorized")
    }
    const events = await eventsModel.findOne(req.params.id)

    if (events.picture) {
      fileRemover(events.picture)
    }

    const eventId = req.params.id
    const data = { ...req.body }
    const event = await eventsModel.update(eventId, id, data)

    const eventCategories = {
      eventId: event.id,
      categoryId: req.body.categoryId,
    }

    await eventCategoriesModel.update(eventCategories)

    return res.json({
      success: true,
      message: "Update events successfully",
      results: event,
    })
  } catch (err) {
    return errorHandler(res, err)
  }
}

exports.destroy = async (req, res) => {
  try {
    const { id } = req.user
    if (!id) {
      throw Error("Unauthorized")
    }
    const events = await eventsModel.findOne(req.params.id)
    const data = await eventsModel.destroy(req.params.id)
    if (events.picture) {
      fileRemover(events.picture)
    }
    await eventCategoriesModel.destroy(req.params.id)
    return res.json({
      success: true,
      message: "Delete events successfully",
      results: data,
    })
  } catch (err) {
    return errorHandler(res, err)
  }
}
