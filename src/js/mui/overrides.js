// https://material-ui.com/customization/globals/
const palette = require('./palette')

module.exports = Object.freeze({
  MuiTableCell: {
    head: {
      borderBottomColor: palette.secondary.light,
      borderBottomWidth: '3px'
    }
  }
})
