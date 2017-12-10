import React, { Component } from 'react';
import './StoreCompare.css'

class StoreCompare extends Component {
    state = {
		stores: [
			{name:"Store_name", link:"Store_link"}
        ],
    }
    render() {
        return (
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
        );
    }
    buildStores(){
		const storeComponents = this.state.platforms.map((store) => {
			const { id, name, link } = store;
			return (
				
				<PlatformSection
					key={id}
					id={id}
					name={name}
					link= {link}
				/>
			);
		});
	
	
		return storeComponents;
	}
}
export default StoreCompare;