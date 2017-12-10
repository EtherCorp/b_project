import React, { Component } from 'react'
import { scaleLinear, scaleTime } from 'd3-scale'
import { select } from 'd3-selection'

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
    const dataMax = this.getMax(this.state.data)
    const yScale = scaleLinear().range([0,dataMax])
    const xScale = scaleTime().range([0,this.props.size])
    const margin = {left: 50, right: 50, top: 25, bottom: 10}
    const g = select(node).append('g').attr('transform','translate('+margin.left+','+margin.right+')')

  }

  getMax() {
    console.log(this.state.data.map((store,index,stores)=>{
      store.prices.reduce((a,b)=>Math.max(a,b))
    }))
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
