import React, {Component} from 'react';

import './AdminSideBar.css';

class AdminSideBar extends Component {
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

         <li id="dash_dashboard"><b>Filtros</b></li>

       </ul>
    );
  }

}

export default AdminSideBar;

