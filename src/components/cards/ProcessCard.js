import React from 'react'
import PropTypes from 'prop-types'
import {
  Card,
  CardActions,
  Box,
  Typography,
  useTheme,
  makeStyles,
  IconButton,
  Collapse,
  Grid,
  useMediaQuery
} from '@material-ui/core'
import ExpandMoreIcon from '@material-ui/icons/ExpandMore'
import clsx from 'clsx'

const useStyles = makeStyles(theme => ({
  step: {
    border: '2px solid',
    borderColor: theme.palette.info.main,
    borderRadius: '50%',
    display: 'inline-block',
    height: '38px',
    width: '38px',
    padding: '1px 0px 0px 9px',
    marginRight: '10px'

  },
  name: {
    display: 'inline-block',
  },
  expand: {
    transform: 'rotate(0deg)',
    marginLeft: 'auto',
    transition: theme.transitions.create('transform', {
      duration: theme.transitions.duration.shortest,
    }),
  },
  expandOpen: {
    transform: 'rotate(180deg)',
  },
}))
/**
 * This component is allows you to specify a step in a process
 *
 */
const ProcessCard = ({ children, step, name, defaultExpanded }) => {
  const theme = useTheme()
  const classes = useStyles(theme)

  const mobile = useMediaQuery(theme.breakpoints.down('xs'))

  const [expanded, setExpanded] = React.useState(defaultExpanded)

  const handleExpandClick = () => {
    setExpanded(!expanded)
  }

  return (
    <Box mb={1}>
      <Card variant='outlined'>
        <Box p={3} pt={0}>
          <Grid container alignItems='center'>
            <Grid item xs={10}>
              {step &&
                <Typography variant='h2' className={classes.step}>{step}</Typography>
              }
              {name &&
                <Typography variant='h2' className={classes.name}>{name}</Typography>
              }
            </Grid>
            {mobile &&
              <Grid item xs={2}>
                <CardActions disableSpacing >
                  <IconButton
                    className={clsx(classes.expand, {
                      [classes.expandOpen]: expanded,
                    })}
                    onClick={handleExpandClick}
                    aria-expanded={expanded}
                    aria-label="show more"
                  >
                    <ExpandMoreIcon />
                  </IconButton>
                </CardActions>
              </Grid>
            }
          </Grid>
          <Collapse in={mobile ? expanded : true} timeout="auto" unmountOnExit>
            <Box pl={5}>
              { children }
            </Box>
          </Collapse>
        </Box>
      </Card>
    </Box>
  )
}

export default ProcessCard

ProcessCard.propTypes = {
  /** This text displayed as the title or name */
  name: PropTypes.string,
  /** This text is displayed next to the name */
  step: PropTypes.oneOfType([
    PropTypes.string,
    PropTypes.number
  ]),
  /** In mobile the card collapses and this allows it to be expanded on initial render */
  defaultExpanded: PropTypes.bool,
}

ProcessCard.defaultProps = {
  defaultExpanded: false,
}
ProcessCard.Preview = {
  group: 'Cards',
  demos: [
    {
      title: 'Process step example',
      code: '<ProcessCard step={1} name={"Plan"}>Text for the process step</ProcessCard>',
    },
    {
      title: 'Default expanded mobile version',
      code: '<ProcessCard defaultExpanded={true} step={4} name={"Mobile Plan"}>Text for the mobile process example</ProcessCard>',
    }
  ]
}
