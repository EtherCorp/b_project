import React, {Component} from 'react';

import PlatformSection from '../PlatformSection/PlatformSection';
import './PlatformList.css';

import {gamesFetchData} from '../../actions/actions'

class PlatformList extends Component{

    componentDidMount(){
        this.props.dispatch(gamesFetchData())
    }

    render(){
        
        if(this.props.isFetching){
            return(
                <h1> Is loading! </h1>
            )
        }

        return(
            <div className="PlatformList-container">
            {this.buildPlatforms()}
            </div>
        );
    }

	buildPlatforms(){
        console.log(this.props.platforms);
		const platformComponents = this.props.platforms.map((platform) => {
            const { id, title, img, cards } = platform;
			return (
				
				<PlatformSection
					key={id}
					id={id}
					title={title}
					cards= {cards}
					img = {img}
				/>
			);
		});
	
	
		return platformComponents;
	}
 
}



export default PlatformList;