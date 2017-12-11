import React, {Component} from 'react';

import './Sidebar.css';
import {Button, Icon, Input} from "react-materialize";

class Sidebar extends Component {
  render() {
    return (
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

         <li id="dash_dashboard">
           <b>Filtros</b>
         </li>


           <Input s={12} type='select' label='Plataforma'  defaultValue='0' className="side-item">
             <option value="0"  selected>Elija consola</option>
             <option value="1">PS4</option>
             <option value="2">Xbox ONE</option>
             <option value="3">Nintendo Switch</option>
           </Input>


         <form action="#">
           <p class="range-field side-item">
             <p>Precio Máximo</p>
             <input type="range" id="test5" min="0" max="80000" step="1000"/>
           </p>
         </form>

         <Input s={12} type='select' label='Géneros'  defaultValue='0' className="side-item">
           <option value="0" selected>Seleccione Género</option>
           <option value="1">Action</option>
           <option value="2">Adventure</option>
           <option value="3">Terror</option>
           <option value="4">Sandbox</option>
           <option value="5">Platformer</option>
           <option value="6">FPS</option>
         </Input>

         <Button waves='light'>Filtrar!<Icon left>filter_list</Icon></Button>
       </ul>
    );
  }

}

export default Sidebar;

