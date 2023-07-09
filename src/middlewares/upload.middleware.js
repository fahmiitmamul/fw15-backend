const multer = require("multer")
const cloudinary = require("cloudinary").v2
const { CloudinaryStorage } = require("multer-storage-cloudinary")

cloudinary.config({
  cloud_name: process.env.CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
})

const storage = new CloudinaryStorage({
  cloudinary: cloudinary,
  params: {
    folder: "uploads",
    format: async () => "png",
    public_id: () => {
      const filename = new Date().getTime().toString()
      return filename
    },
  },
})

const limits = {
  fileSize: 1 * 4096 * 8192,
}
const fileFilter = (req, file, cb) => {
  if (
    file.mimetype == "image/png" ||
    file.mimetype == "image/jpg" ||
    file.mimetype == "image/jpeg" ||
    file.mimetype == "image/heic" ||
    file.mimetype == "image/svg+xml"
  ) {
    cb(null, true)
  } else {
    return cb(new Error("Invalid mime type"))
  }
}

const upload = multer({ storage, fileFilter })

const uploadMiddleware = (field) => {
  const uploadField = upload.single(field)
  return (request, response, next) => {
    uploadField(request, response, (err) => {
      if (err) {
        if (err.message === "fileformat_error") {
          return response.status(400).json({
            success: false,
            message: "File format invalid",
          })
        }
      }
      return next()
    })
  }
}

module.exports = uploadMiddleware
