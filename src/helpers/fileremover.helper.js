const cloudinary = require("cloudinary").v2

const fileRemover = async (file) => {
  if (file) {
    try {
      const filename = file.slice(8)
      console.log(filename)
      await cloudinary.uploader.destroy(filename)
    } catch (err) {
      console.log(err)
    }
  }
}

module.exports = fileRemover
