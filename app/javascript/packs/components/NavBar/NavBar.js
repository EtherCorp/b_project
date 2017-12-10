import React, {Component} from 'react';

import './NavBar.css';

class NavBar extends Component {
  render() {
    return (
       <header>

         <ul className="dropdown-content" id="user_dropdown">
           <li><a className="grey-text" href="#!">Profile</a></li>
           <li><a className="grey-text" href="#!">Logout</a></li>
         </ul>

         <nav className="grey" role="navigation">
           <div className="nav-wrapper">
             <a data-activates="slide-out" className="button-collapse show-on-large banana-logo"
                href="#!"><img src=""/>
             </a>

             <ul className="right hide-on-med-and-down">

               <li>
                 <div className="input-field col s6">
                   <input placeholder="Buscar aquí" id="search" type="text"
                          className="validate"/>
                 </div>
               </li>

               <li>
                 <a href="#!"><i className="material-icons">search</i></a>
               </li>

               <li>
                 <a className='right dropdown-button' href='' data-activates='user_dropdown'><i
                    className=' material-icons'>account_circle</i></a>
               </li>

             </ul>

             <a href="#" data-activates="slide-out" className="button-collapse"><i
                className="mdi-navigation-menu">menu</i></a>
           </div>
         </nav>

         <nav>
           <div className="nav-wrapper grey darken-2 breadcrumb-style">
             <a className="breadcrumb " href="#!">Home</a>
           </div>
         </nav>

       </header>

    );
  }
}

export default NavBar;

