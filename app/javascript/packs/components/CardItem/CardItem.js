import React, {Component} from 'react';

import './CardItem.css';

class CardItem extends Component{
    render(){
        return(
            <div className = 'CardItem-container'>
                <div className="col s12 m4 l3">
                    <div className="card small">
                        <a href={this.props.url}>
                            <div className="card-image">
                            {console.log(this.props.img)}
                                <img src={this.props.img}/>
                            </div>
                            <div className="card-content">
                                <p>{this.props.title}</p>
                            </div>
                            <div className="card-action price">
                                ${this.props.price}
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        );
    }
 
}

export default CardItem;