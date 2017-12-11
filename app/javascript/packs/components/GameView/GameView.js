import React, { Component } from 'react';

import './GameView.css';
import {gameFetchData} from '../../actions/actions'
import { Button, Card, Row, Col, Input, Modal, Icon } from 'react-materialize'
import PriceChart from '../PriceChart/PriceChart';

class GameView extends Component {

    componentDidMount(){
        this.props.dispatch(gameFetchData(this.props.match.params.id))
    }

    render() {

        return (
            <div className='CardView-container'>
                <div className="row">
                    <div className="col s12 m4 l3">
                        <div className="card small ">
                            <div className="card-image">
                                <img src={this.props.game.img} />
                            </div>
                        </div>
                    </div>
                    <div className='Card-description'>
                        <ul>
                            <li>Titulo:{this.props.game.title} </li>
                            <li>Descripcion: {this.props.game.description} </li>
                        </ul>
                    </div>
                </div>
                <div className='Store-compare row'>
                    <div className='table'>
                        <table className="striped">
                            <thead>
                                <tr>
                                    <th>Tienda</th>
                                    <th>Precio</th>
                                    <th>Ir al sitio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                <td>Weplay</td>
                                <td>$29990</td>
                                <td>
                                    <button className="btn waves-effect waves-light" type="submit" name="action">Ir a tienda
                                        <i className="material-icons right">store</i>
                                    </button>
                                </td>

                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <PriceChart/>               
            </div>

        );
    }
/*
    buildStoress(){

		const storeComponents = this.props.game.stores.map((store) => {
            const { title, price } = store;
            return (
			);
		});
	
	
		return storeComponents;
    }*/
}
export default GameView;