import React, {Component} from 'react';

import CardItem from '../CardItem/CardItem';
import './PlatformSection.css';

class PlatformSection extends Component{
    render(){
        return(

            <div className = 'PlatformSection-container'>
                <div align="center" className="card card-style">
                    {/*<div className = 'PlatformSection-title'>
                    {this.props.title}
                    </div>*/}

                    <div className="row">
                        <img height="40px"
                        src={this.props.imgPlatform}/>
                    </div>

                    <div className='PlatformSection-CardItems'>
                    <div className="row">
                    {this.buildGames()}
                    </div>
                    </div>
                </div>
            </div>
            
        );
    }
    buildGames() {
        const cardsComponents = this.props.cards.map((card) => {
            const { id, title, img, price, url, description } = card;
            return (
              <CardItem
                key={id}
                id={id}
                title={title}
                img={img}
                price={price}
                url={url}
                description={description}
              />
            );
          });
        
        return cardsComponents;
    }
 
}



export default PlatformSection;