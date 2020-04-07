import React, { useContext } from 'react'
// import { graphql } from 'gatsby'
import { useQuery } from '@apollo/react-hooks'
import gql from 'graphql-tag'
// utility functions
import utils from '../../../js/utils'
import { StoreContext } from '../../../store'

import { makeStyles } from '@material-ui/core/styles'
import Card from '@material-ui/core/Card'
import CardActions from '@material-ui/core/CardActions'
import CardHeader from '@material-ui/core/CardHeader'
import CardContent from '@material-ui/core/CardContent'
import Typography from '@material-ui/core/Typography'
import Grid from '@material-ui/core/Grid'
import Box from '@material-ui/core/Box'
import CircularProgress from '@material-ui/core/CircularProgress'
import Chip from '@material-ui/core/Chip'

import CloseIcon from '@material-ui/icons/Close'
import IconMap from '-!svg-react-loader!../../../img/svg/icon-us-map.svg'
import CircleChart from '../../data-viz/CircleChart/CircleChart.js'

const APOLLO_QUERY = gql`
  query TopLocations($year: Int!, $location: String! ) {
    fiscal_revenue_summary(
where: {location_type: {_eq: $location}, fiscal_year: { _eq: $year }, location_name: {_neq: ""} }
      order_by: { fiscal_year: asc, sum: desc }
    ) {
      location_name
      fiscal_year
      state_or_area
      sum
    }

  }
`
const useStyles = makeStyles(theme => ({
  root: {
    maxWidth: '100%',
    width: '100%',
    margin: theme.spacing(1),
    '@media (max-width: 768px)': {
      maxWidth: '100%',
    }
  },
   progressContainer: {
    maxWidth: '25%',
    display: 'flex',
    '& > *': {
      marginTop: theme.spacing(3),
      marginRight: 'auto',
      marginLeft: 'auto',
    }
   },
  circularProgressRoot: {
    color: theme.palette.primary.dark,
  }, 
}))

const TopLocations = props => {
  const classes = useStyles()
  const { state } = useContext(StoreContext)
  const year = state.year
  const location = state.countyLevel
  
  console.debug("location: ", state);
  const { loading, error, data } = useQuery(APOLLO_QUERY, { variables: { year, location } })

  if (loading) {
    return (
      <div className={classes.progressContainer}>
        <CircularProgress classes={{ root: classes.circularProgressRoot }} />
      </div>
    )
  }
  if (error) return `Error! ${ error.message }`
  let chartData=[];
  const dataSet = `FY ${ year }`
  if (data) {
    chartData = data.fiscal_revenue_summary
  }

  return (
    <Box className={classes.root}>
      <Box component="h4" fontWeight="bold">Top Locations</Box>
      <Box height="1200px" >
        <CircleChart
          data={chartData}
          xAxis='location_name'
          yAxis='sum'
          format={ d => utils.formatToDollarInt(d) }
          circleLabel={ d =>{ console.debug('circleLABLE: ', d)
                              let r=[]
                               r[0] = d.location_name
                               r[1] = utils.formatToDollarInt(d.sum)
                              return r
                            }
          }
          
          yLabel={dataSet}
          maxCircles={6}
          maxColor='rgb(47, 77, 38)' minColor='rgb(144, 169, 135)' />
      </Box>
    </Box>
  )
  
  
}

export default TopLocations
