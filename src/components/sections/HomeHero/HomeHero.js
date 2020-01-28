import React from 'react'
import Typography from '@material-ui/core/Typography'
import Box from '@material-ui/core/Box'

import { GlossaryTerm } from '../../utils/GlossaryTerm'

const HomeHero = () => {
  return (
    <Typography variant="subtitle1">
      <Box pt={5} pb={10}>
        When companies extract energy and mineral resources on property
        leased from the federal government and Native Americans, they pay{' '}
        <GlossaryTerm termKey="Bonus">bonuses</GlossaryTerm>,{' '}
        <GlossaryTerm>rent</GlossaryTerm>, and{' '}
        <GlossaryTerm termKey="Royalty">royalties</GlossaryTerm>. The
        Office of Natural Resources Revenue (ONRR) collects and{' '}
        <GlossaryTerm termKey="disbursement">disburses</GlossaryTerm>{' '}
        revenue from federal lands and waters to different agencies,
        funds, and local governments for public use. All revenue collected
        from extraction on Native American lands is disbursed to Native
        American tribes, nations, or individuals.
      </Box>
    </Typography>
  )
}

export default HomeHero