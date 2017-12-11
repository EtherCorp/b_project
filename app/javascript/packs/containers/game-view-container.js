import { connect } from 'react-redux'
//import { setVisibilityFilter } from '../actions'
import GameView from '../components/GameView/GameView'

const mapStateToProps = (state) => ({

//Problema potencial al tener varios juegos viendo al mismo tiempo
  game: state.game,
  isFetching: state.isFetching
})
/*
const mapDispatchToProps = (dispatch, ownProps) => ({
  onClick: () => {
    dispatch(setVisibilityFilter(ownProps.filter))
  }
})
*/


export default connect(
  mapStateToProps
  //mapDispatchToProps
)(GameView)

