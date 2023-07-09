const fileRemover = require("../helpers/fileremover.helper")
const profileModel = require("../models/admin/profile.model")
const usersModel = require("../models/admin/users.model")
const errorHandler = require("../helpers/errorHandler.helper")

exports.updateProfile = async (req, res) => {
  try {
    const { id } = req.user

    if (!id) {
      throw Error("Unauthorized")
    }

    const user = await profileModel.findOneByUserId(id)
    const users = { username: req.body.username, email: req.body.email }
    const data = {
      ...req.body,
    }
    if (user.picture) {
      fileRemover(user.picture)
    }
    if (req.file) {
      data.picture = req.file.filename
    }
    const profileUpdate = await profileModel.updatebyUserId(id, data)
    await usersModel.update(id, users)
    if (!profileUpdate) {
      throw Error("Update profile failed")
    }
    return res.json({
      success: true,
      message: "Profile updated",
      result: { profileUpdate },
    })
  } catch (e) {
    return errorHandler(res, e)
  }
}

exports.getProfile = async (req, res) => {
  try {
    const { id } = req.user

    if (!id) {
      throw Error("Unauthorized")
    }

    const profile = await profileModel.findOneByUserId(id)
    if (!profile) {
      throw Error("profile_not_found")
    }
    return res.json({
      success: true,
      message: "Profile",
      results: profile,
    })
  } catch (e) {
    return errorHandler(res, e)
  }
}
