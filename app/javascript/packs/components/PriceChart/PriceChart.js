import React, { Component } from 'react'
import { scaleLinear, scaleTime, scaleOrdinal, schemeCategory20 } from 'd3-scale'
import { select } from 'd3-selection'
import { line, curveBasis } from 'd3-shape'
import { axisBottom, axisLeft } from 'd3-axis'
import { timeParse } from 'd3-time-format'
import { extent } from 'd3-array'
import './PriceChart.css'

class PriceChart extends Component {
  state = {
    data:[
      {
        store:'',
        prices:[
          {date:'',price:0}
        ]
      }
    ]
  }

  constructor(props) {
    super(props)
//    this.createChart = this.createChart.bind(this)
  }

  createChart() {
    const node = this.node
    const node_ = select(node)
    const dataMax = this.getMax(this.state.data)
    const margin = { left: 50, right: 50, top: 25, bottom: 25 }
    const width = node_.attr("width") - margin.left - margin.right
    const height = node_.attr("height") - margin.top - margin.bottom
    const g = select(node).append('g').attr('transform', 'translate(' + margin.left + ',' + margin.top + ')')
    const parseTime = timeParse("%Y-%m-%d")
    const x = scaleTime().range([0, width])
    const y = scaleLinear().range([height, 0])
    const z = scaleOrdinal().range(schemeCategory20)
    const line_ = line().x((d) => x(d.date)).y((d) => y(d.price))
    this.state.data.forEach(store => {
      store.prices.forEach(price => {
        price.date = parseTime(price.date)
        price.price = price.price
      })
    })
    x.domain([parseTime("2017-01-01"),parseTime("2017-12-10")])
    y.domain([0, dataMax])
    z.domain(this.state.data.map((store,index,stores)=>store.store))
    g.append("g").attr("class", "axis axis--x").attr("transform", "translate(0," + height + ")").call(axisBottom(x))
    g.append("g").attr("class", "axis axis--y").call(axisLeft(y)).append("text").attr("transform", "rotate(-90)").attr("y", 6).attr("dy", "0.71em").attr("fill", "#000").text("Precio, CLP")

    const store = g.selectAll(".store").data(this.state.data).enter().append("g").attr("class","store")
    store.append("path").datum((d)=> ({id: d.store, prices: d.prices})).attr("class", "line").attr("d", (d)=>line_(d.prices)).style("stroke",(d)=>d.id)
    store.append("text").datum((d)=> ({id:d.store, value:d.prices[d.prices.length -1]})).attr("transform",(d)=>"translate("+x(d.value.date)+","+y(d.value.price)+")").attr("dy","0.35em").style("font","12px sans-serif").text((d)=>d.id)

  }

  getMax(data) {
    return data.map(
      (store,index,stores) => store.prices.map(
        (priceStamp,index,prices) => priceStamp.price
      ).reduce(
        (a,b) => Math.max(a,b)
      )
    ).reduce(
      (a,b) => Math.max(a,b)
    )
  }

  componentWillMount(){
    //TODO connection with API to load data
    this.state.data = [
      {
        store: 'sniper',
        prices: [
          { date: '2017-01-01', price: 900 },
          { date: '2017-08-01', price: 500 },
          { date: '2017-09-01', price: 480 },
          { date: '2017-10-01', price: 450 },
        ]
      },
        {
          store: 'weplay',
          prices: [
            { date: '2017-01-01', price: 999 },
            { date: '2017-07-20', price: 650 },
            { date: '2017-08-15', price: 450 },
            { date: '2017-10-01', price: 430 },
          ]
        },
        {
          store: 'zmart',
          prices: [
            { date: '2017-01-01', price: 950 },
            { date: '2017-07-30', price: 700 },
            { date: '2017-09-01', price: 499 },
            { date: '2017-10-01', price: 400 },
          ]
        }
      ]
  }

  componentDidMount(){
    this.createChart()
  }

  render() {
    return (
      <svg ref={node => this.node = node} width={700} height={500}>
      </svg>
    )
  }
}

export default PriceChart
