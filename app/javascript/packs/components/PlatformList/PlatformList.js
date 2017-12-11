import React, {Component} from 'react';

import PlatformSection from '../PlatformSection/PlatformSection';
import './PlatformList.css';

class PlatformList extends Component{
    render(){
        return(
            <div className="PlatformList-container">
            {this.buildPlatforms()}
            </div>
        );
    }

	buildPlatforms(){
        console.log(this.props.platforms);
		const platformComponents = this.props.platforms.map((platform) => {
			const { id, title, imgPlatform, cards } = platform;
			return (
				
				<PlatformSection
					key={id}
					id={id}
					title={title}
					cards= {cards}
					imgPlatform = {imgPlatform}
				/>
			);
		});
	
	
		return platformComponents;
	}
 
}



export default PlatformList;