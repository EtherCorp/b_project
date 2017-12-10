import React, { Component } from 'react';

import './GameView.css';

class GameView extends Component {
    render() {
        return (
            <div className='CardView-container'>
                <div className="row">
                    <div className="col s12 m4 l3">
                        <div className="card small ">
                            <div className="card-image">
                                <img src={this.props.img} />
                            </div>
                        </div>
                    </div>
                    <div className='Card-description'>
                        <ul>
                            <li>Titulo: </li>
                            <li>Descripcion: </li>
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
                                    <td>Tienda1</td>
                                    <td>$999</td>
                                    <td>
                                        <button className="btn waves-effect waves-light" type="submit" name="action">Ir a tienda
                                             <i className="material-icons right">store</i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Tienda2</td>
                                    <td>$999</td>
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
                <a className="btn-floating btn-large waves-effect waves-light blue darken-3"><i className="material-icons">insert_chart</i></a>
            </div>

        );
    }
}
export default GameView;