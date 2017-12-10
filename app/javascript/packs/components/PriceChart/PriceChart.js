import React, { Component } from 'react'
import { scaleLinear } from 'd3-scale'
import { select } from 'd3-selection'
import { scaleTime } from '../../../../../../../../AppData/Local/Microsoft/TypeScript/2.6/node_modules/@types/d3-scale';

class PriceChart extends Component {
  state = {
    data:[
      {
        store:'sniper',
        prices:[]
      },
      {
        store:'weplay',
        prices:[]
      },
      {
        store:'zmart',
        prices:[]
      },
    ]
  }

  constructor(props) {
    super(props)
    this.createChart = this.createChart.bind(this)
  }

  createChart() {
    const node = this.node
    const dataMax = getMax(this.state.data)
    const yScale = scaleLinear().range([0,dataMax])
    const xScale = scaleTime().range([0,])
  }

  componentWillMount(){
    //TODO connection with API to load data
  }

  componentDidMount(){
    this.createChart()
  }

  render() {
    return (
      <svg ref={node => this.node = node} width={500} height={500}>
      </svg>
    )
  }
}

export default PriceChart
