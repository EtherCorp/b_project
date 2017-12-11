import React, {Component} from 'react';
import './App.css';
import { Router, Route, browserHistory } from 'react-router'
import PlatformList from '../components/PlatformList/PlatformList';
import Sidebar from '../components/Sidebar/Sidebar';
import Footer from '../components/Footer/Footer';
import GameView from '../components/GameView/GameView';
import NavBar from '../components/NavBar/NavBar';
import AdminView from '../components/AdminView/AdminView';
import AdminSideBar from '../components/AdminSideBar/AdminSideBar';

import PlatformListContainer from '../containers/platform-list-container'

class App extends Component {
	
	render() {
		return (
			<div className="App">
				<main>

					{/* --- BANNER --- */}
					<NavBar/>

					{/* --- SIDEBAR --- */}
					<Sidebar/>
					{/*<AdminSidebar/>*/}

					{/* --- BODY --- */}
					<main>
						<div className="col s12">
							<div className="row wrap">
								
					<PlatformListContainer />
					{/*<GameView /> */}				
					{/*<AdminView />*/}

							</div>
						</div>
					</main>

					<Footer />

				</main>
			</div>
		);
	}
}

export default App;
