/* eslint-disable max-len */
// https://material-ui.com/customization/globals/
const {
  primary,
  // secondary,
  // grey,
  // text
} = require('./palette')

module.exports = Object.freeze({
  // https://material-ui.com/api/app-bar/
  MuiAppBar: {
    root: {
      boxShadow: '0px 2px 4px -1px rgba(0,0,0,0.3), 0px 2px 4px -1px rgba(0,0,0,0.14), 0px 2px 4px -1px rgba(0,0,0,0.12)'
    }
  },
  // https://material-ui.com/components/buttons/
  MuiButton: {
    // Name of the rule
    root: {
      backgroundColor: primary.light,
      '&:hover': {
        backgroundColor: primary.light,
      }
    },
    text: {
      // Some CSS
      borderRadius: 5,
      border: 'none',
      color: 'white',
      height: 48,
      padding: '0 30px',
      boxShadow: '0 2px 5px 2px rgba(0, 0, 0, .2)',
      textTransform: 'inherit',
      fontSize: '1.2rem',
      '&:hover': {
        textDecoration: 'underline',
      }
    },
  },
  // https://material-ui.com/api/link/
  MuiLink: {
    root: {
      color: primary.light,
    },
    underlineAlways: {
      textDecoration: 'underline',
      '&:hover': {
        textDecoration: 'none',
      }
    }
  },
  // https://material-ui.com/components/tabs/#tabs
  MuiTabs: {
    root: {
      background: 'white',
      '& .Mui-selected': {
        backgroundColor: 'white',
        color: '#435159 !important',
        textColor: '#435159',
        border: '1px solid #435159',
        borderTop: '5px solid #435159',
        borderBottom: 'none',
        zIndex: 20,
      },
    },
    indicator: {
      backgroundColor: 'white',
      border: 'none',
    },
    flexContainer: {
      '@media (max-width: 425px)': {
        display: 'block',
        marginBottom: '1rem',
      }
    }
  },
  // https://material-ui.com/api/tab/
  MuiTab: {
    root: {
      background: '#f0f6fa',
      borderTop: '5px solid #f0f6fa',
      marginLeft: '10px',
      color: '#435159',
      '& span:hover': {
        textDecoration: 'underline',
      },
      '@media (max-width: 425px)': {
        marginLeft: 0,
        width: '100%',
        display: 'block',
      }
    },
    wrapper: {
      textTransform: 'capitalize',
      fontSize: '1.2rem',
      fontWeight: '400',
    },
  },
  // https://material-ui.com/api/divider/
  MuiDivider: {
    light: {
      backgroundColor: '#435159',
      margin: '1rem 0',
    }
  },
  // https://material-ui.com/api/list/
  MuiList: {
    root: {
      marginBottom: '1.2rem',
      color: primary.light,
    }
  },
  MuiListItem: {
    root: {
      '& a span': {
        color: primary.light
      },
      '& a:hover': {
        textDecoration: 'none'
      }
    }
  },
  // https://material-ui.com/api/list-item-icon/
  MuiListItemIcon: {
    root: {
      minWidth: '18px',
      color: '#000',
      marginRight: 0,
    }
  },
  // https://material-ui.com/api/icon/
  MuiIcon: {
    colorSecondary: '#fff'
  },
  // https://material-ui.com/api/paper/
  MuiPaper: {
    root: {
    }
  },
  // https://material-ui.com/api/slider/
  MuiSlider: {
    root: {
      color: '#435159'
    }
  },
  // https://material-ui.com/api/table-cell/
  MuiTableCell: {
    // root: {
    //   padding: 0
    // },
    sizeSmall: {
      padding: 0
    }
  },
  // https://material-ui.com/api/outlined-input/#outlinedinput-api
  MuiOutlinedInput: {
    root: {
      fontFamily: 'Lato, "Helvetica Neue", Helvetica, arial, sans-serif',
      '& > #search-input::-webkit-search-cancel-button': {
        '-webkit-appearance': 'none',
        height: 15,
        width: 15,
        /*
        * Base64 encoded custom "X" icon
        * Natively 30x30, but downscaled for highres screens
        */
        backgroundImage: 'url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAn0lEQVR42u3UMQrDMBBEUZ9WfQqDmm22EaTyjRMHAlM5K+Y7lb0wnUZPIKHlnutOa+25Z4D++MRBX98MD1V/trSppLKHqj9TTBWKcoUqffbUcbBBEhTjBOV4ja4l4OIAZThEOV6jHO8ARXD+gPPvKMABinGOrnu6gTNUawrcQKNCAQ7QeTxORzle3+sDfjJpPCqhJh7GixZq4rHcc9l5A9qZ+WeBhgEuAAAAAElFTkSuQmCC)',
        backgroundSize: 15,
        backgroundRepeat: 'no-repeat',
        backgroundPosition: 'top left',
      }
    },
  },
  MuiTypography: {
    root: {
      '& + .h3Bar': {
        borderBottom: '2px solid #cde3c3',
        marginBottom: '1em',
        paddingBottom: '.41667rem',
      }
    },
  }
})
