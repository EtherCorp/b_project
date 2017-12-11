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

	state = {
		test_platform: [
			{titlePlatform:"xbox", cards: [{title: 'My title',description: 'My description'}]}
		],/*
		platforms: [

			{id: 'play4', title:'play 4',
			imgPlatform:"https://logodownload.org/wp-content/uploads/2017/05/playstation-4-logo-ps4-8.png",
			cards: [
				{ title: 'My title',description: 'My description', price:"999", img:"#",url:"#" },
				{ title: 'My title 2',description: 'My description 2', price:"999", img:"#",url:"#" },
				{ title: 'My title 2',description: 'My description 2', price:"999", img:"#",url:"#" }
				]},
			{id: 'xone', title:'xbox one',
			imgPlatform:"https://cdn.worldvectorlogo.com/logos/xbox-one-3.svg",
			cards: [
			{ title: 'My title',description: 'My description', price:"999", img:"#",url:"#" },
			{ title: 'My title 2',description: 'My description 2', price:"999", img:"#",url:"#" },
			{ title: 'My title 2',description: 'My description 2', price:"999", img:"#",url:"#" }
			]},
			{id: 'nintendo', title:'nintendo',
			imgPlatform:"https://vignette3.wikia.nocookie.net/new-fantendo/images/5/5a/Nintendo_Switch_logo.png/revision/latest?cb=20161023110124&path-prefix=es",
			cards: [
				{ title: 'My title',description: 'My description', price:"999", img:"https://www.btgames.co.za/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/P/R/PR26253BI15617_N017112902011240_NS_SUPER_MARIO_ODYSSEY_SZ1.jpg",url:"#" },
				{ title: 'My title 2',description: 'My description 2', price:"999", img:"#",url:"#" },
				{ title: 'My title 2',description: 'My description 2', price:"999", img:"#",url:"#" }
				]}

		],*/
		
	}
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
	
	obtainCards(id){
		
		const cards = this.state.cards.map((platform) => {
			const { id, title, } = platform;
			
		});
		return cards;
	}
}

export default App;
