import React, {Component} from 'react';

import './Sidebar.css';

class Sidebar extends Component{
    render(){
        return(
            <ul id="slide-out" className="side-nav fixed z-depth-2">

                        <li className="center no-padding">
                        <div className="grey darken-2 white-text main-icon">
                            <div className="row">
                            <img width="100" height="100"
                                src="http://i65.tinypic.com/9kw70h.png"
                                className="responsive-img logo-style"/>
                            </div>
                        </div>
                        </li>

                        <li id="dash_dashboard"><a className="waves-effect" href="#!"><b>Filtros</b></a></li>

                        <div className="input-field col s12 platform-box">
                        <select>
                            <option value="" disabled selected>Elija consola</option>
                            <option value="1">PS4</option>
                            <option value="2">Xbox ONE</option>
                            <option value="3">Nintendo Switch</option>
                        </select>
                        <label>Plataforma</label>
                        </div>


                        <div className="range-">
                        <form action="#">
                        <p className="range-field platform-box" >

                            <div className="row">
                            <input type="range" id="test5" min="0" max="200000" step="1000"/>

                            </div>
                        </p>
                        </form>
                        </div>


                        <div className="chip tag-style">
                        Action
                        <i className="close material-icons">close</i>
                        </div>
                        <div className="chip tag-style">
                        Adventure
                        <i className="close material-icons ">close</i>
                        </div>
                        <div className="chip tag-style">
                        Terror
                        <i className="close material-icons ">close</i>
                        </div>
                        <div className="chip tag-style">
                        Sandbox
                        <i className="close material-icons ">close</i>
                        </div>
                        <div className="chip tag-style">
                        FPS
                        <i className="close material-icons">close</i>
                        </div>
                        <div className="chip tag-style">
                        Platform
                        <i className="close material-icons">close</i>
                        </div>
            </ul>
        );
    }
 
}

export default Sidebar;

