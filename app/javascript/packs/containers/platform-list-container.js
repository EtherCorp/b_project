import { connect } from 'react-redux'
//import { setVisibilityFilter } from '../actions'
import PlatformList from '../components/PlatformList/PlatformList'

const mapStateToProps = (state) => ({
  platforms: state.platforms,
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
)(PlatformList)

