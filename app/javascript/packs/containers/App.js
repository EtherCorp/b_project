import React, {Component} from 'react';
import './App.css';

import {Navbar, NavItem, Icon, Footer, Input, MenuItem} from 'react-materialize';


class App extends Component {
  render() {
    return (
      <div className="App">

        <main>

          <ul id="slide-out" className="side-nav fixed z-depth-2">

            <li className="center no-padding">
              <div className="grey darken-2 white-text main-icon">
                <div className="row">
                  <img width="100" height="100"
<<<<<<< HEAD
                       src="http://i65.tinypic.com/9kw70h.png"
=======
                       src="https://lh6.googleusercontent.com/bAaVGAoZ2SIvBp8ljutGvY47s5tsV4mH3rg-M6B3kOkyVQ-qsbbyrdcHk-YN10mYNuhgIqgwmoHy492OJwl2=w1301-h668"
>>>>>>> homepage
                       className="responsive-img logo-style"/>
                </div>
              </div>
            </li>

            <li id="dash_dashboard"><a className="waves-effect" href="#!"><b>Filtros</b></a></li>

<<<<<<< HEAD
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


=======
            <ul className="collapsible" data-collapsible="accordion">
              
              <li id="dash_users">
                <div id="dash_users_header" className="collapsible-header waves-effect"><b>Users</b></div>
                <div id="dash_users_body" className="collapsible-body">
                  <ul>
                    <li id="users_seller">
                      <a className="waves-effect" href="#!">Seller</a>
                    </li>
                    <li id="users_customer">
                      <a className="waves-effect" href="#!">Customer</a>
                    </li>
                  </ul>
                </div>
              </li>

              <li id="dash_products">
                <div id="dash_products_header" className="collapsible-header waves-effect"><b>Products</b></div>
                <div id="dash_products_body" className="collapsible-body">
                  <ul>
                    <li id="products_product">
                      <a className="waves-effect" href="#!">Products</a>
                      <a className="waves-effect" href="#!">Orders</a>
                    </li>
                  </ul>
                </div>
              </li>

              <li id="dash_categories">
                <div id="dash_categories_header" className="collapsible-header waves-effect"><b>Categories</b></div>
                <div id="dash_categories_body" className="collapsible-body">
                  <ul>
                    <li id="categories_category">
                      <a className="waves-effect" href="#!">Category</a>
                    </li>

                    <li id="categories_sub_category">
                      <a className="waves-effect" href="#!">Sub Category</a>
                    </li>
                  </ul>
                </div>
              </li>
              
            </ul>
>>>>>>> homepage

          </ul>

          <header>
            <ul className="dropdown-content" id="user_dropdown">
              <li><a className="grey-text" href="#!">Profile</a></li>
              <li><a className="grey-text" href="#!">Logout</a></li>
            </ul>

            <nav className="grey" role="navigation">
              <div className="nav-wrapper">
                <a data-activates="slide-out" className="button-collapse show-on-large banana-logo" href="#!"><img
                  src=""/></a>

                <ul className="right hide-on-med-and-down">
                  <li>
<<<<<<< HEAD
                    <li><a href="#!"><i class="material-icons">search</i></a></li>
=======
>>>>>>> homepage
                    <a className='right dropdown-button' href='' data-activates='user_dropdown'><i
                      className=' material-icons'>account_circle</i></a>
                  </li>
                </ul>

                <a href="#" data-activates="slide-out" className="button-collapse"><i
                  className="mdi-navigation-menu"></i></a>
              </div>
            </nav>

            <nav>
<<<<<<< HEAD
              <div className="nav-wrapper grey darken-2 breadcrumb-style">
                <a className="breadcrumb " href="#!">Home</a>
=======
              <div className="nav-wrapper grey darken-2">
                <a className="breadcrumb breadcrumb-style" href="#!">Admin</a>
                <a className="breadcrumb" href="#!">Index</a>
>>>>>>> homepage
                <div id="timestamp" className="right timestamp-style"></div>
              </div>
            </nav>

          </header>


          <main>
            <div className="col s12">
              <div className="row wrap">

                <div align="center" className="card card-style">

                  <div className="row">
                    <img height="40px"
                      src="https://logodownload.org/wp-content/uploads/2017/05/playstation-4-logo-ps4-8.png"/>
                  </div>

                  <div className="row">

                    <div className="col s12 m4 l3">
                      <div className="card small">
                        <div className="card-image">
                          <img src="https://www.dualshockers.com/wp-content/uploads/2016/07/640x960_wallpaper.jpg"/>
                        </div>
                        <div className="card-content">
                          <p>Horizon Zero Dawn</p>
                        </div>
                        <div className="card-action price">
                          <a href="#">$ 35.000</a>
                        </div>
                      </div>
                    </div>

                    <div className="col s12 m4 l3">
                      <div className="card small">
                        <div className="card-image">
                          <img src="https://images-na.ssl-images-amazon.com/images/I/51K%2B%2BMHWKmL.jpg"/>
                        </div>
                        <div className="card-content">
                          <p>Call of Duty - WWII</p>
                        </div>
                        <div className="card-action price">
                          <a href="#">$ 35.000</a>
                        </div>
                      </div>
                    </div>

                    <div className="col s12 m4 l3">
                      <div className="card small">
                        <div className="card-image">
                          <img src="http://ushuaiaplay.com.ar/wp-content/uploads/2016/02/1884575-shadow_of_the_colossus_cover.jpg"/>
                        </div>
                        <div className="card-content">
                          <p>Shadow of the Colossus</p>
                        </div>
                        <div className="card-action price">
                          <a href="#">$ 35.000</a>
                        </div>
                      </div>
                    </div>

                    <div className="col s12 m4 l3">
                      <div className="card small">
                        <div className="card-image">
                          <img src="https://www.3mglive.com/wp-content/uploads/Destiny-2.jpg"/>
                        </div>
                        <div className="card-content">
                          <p>Destiny 2</p>
                        </div>
                        <div className="card-action price">
                          <a href="#">$ 35.000</a>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>


                <div align="center" className="card card-style">

                  <div className="row">
                    <img height="40px"
                         src="https://vignette3.wikia.nocookie.net/new-fantendo/images/5/5a/Nintendo_Switch_logo.png/revision/latest?cb=20161023110124&path-prefix=es"/>
                  </div>

                  <div className="row">

                    <div className="col s12 m4 l3">
                      <div className="card small">
                        <div className="card-image">
                          <img src="http://www.mobygames.com/images/covers/l/433847-the-legend-of-zelda-breath-of-the-wild-nintendo-switch-front-cover.jpg"/>
                        </div>
                        <div className="card-content">
                          <p>The Legend of Zelda - Breath of the Wild</p>
                        </div>
                        <div className="card-action price">
                          <a href="#">$ 35.000</a>
                        </div>
                      </div>
                    </div>

                    <div className="col s12 m4 l3">
                      <div className="card small">
                        <div className="card-image">
                          <img src="https://www.btgames.co.za/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/P/R/PR26253BI15617_N017112902011240_NS_SUPER_MARIO_ODYSSEY_SZ1.jpg"/>
                        </div>
                        <div className="card-content">
                          <p>Super Mario Odyssey</p>
                        </div>
                        <div className="card-action price">
                          <a href="#">$ 35.000</a>
                        </div>
                      </div>
                    </div>

                    <div className="col s12 m4 l3">
                      <div className="card small">
                        <div className="card-image">
                          <img src="http://orig08.deviantart.net/7e5c/f/2017/076/1/8/sonic_mania_artwork_hd_1_by_sonicx2011-db2oln0.jpg"/>
                        </div>
                        <div className="card-content">
                          <p>Sonic Mania</p>
                        </div>
                        <div className="card-action price">
                          <a href="#">$ 35.000</a>
                        </div>
                      </div>
                    </div>

                    <div className="col s12 m4 l3">
                      <div className="card small">
                        <div className="card-image">
                          <img src="http://www.nintendoforcemagazine.com/wp-content/uploads/2017/02/ARMS-Poster.png"/>
                        </div>
                        <div className="card-content">
                          <p>Arms</p>
                        </div>
                        <div className="card-action price">
                          <a href="#">$ 35.000</a>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>

                <div align="center" className="card card-style">

                  <div className="row">
                    <img height="40px"
                         src="https://cdn.worldvectorlogo.com/logos/xbox-one-3.svg"/>
                  </div>

                  <div className="row">

                    <div className="col s12 m4 l3">
                      <div className="card small">
                        <div className="card-image">
                          <img src="https://upload.wikimedia.org/wikipedia/en/d/d5/For_Honor_cover_art.jpg"/>
                        </div>
                        <div className="card-content">
                          <p>For Honor</p>
                        </div>
                        <div className="card-action price">
                          <a href="#">$ 35.000</a>
                        </div>
                      </div>
                    </div>

                    <div className="col s12 m4 l3">
                      <div className="card small">
                        <div className="card-image">
                          <img src="http://www.mobygames.com/images/covers/l/361715-far-cry-primal-xbox-one-front-cover.png"/>
                        </div>
                        <div className="card-content">
                          <p>Far Cry Primal</p>
                        </div>
                        <div className="card-action price">
                          <a href="#">$ 35.000</a>
                        </div>
                      </div>
                    </div>

                    <div className="col s12 m4 l3">
                      <div className="card small">
                        <div className="card-image">
                          <img src="https://www.warnerbros.com/sites/default/files/styles/key_art_270x400/public/game/media/browser/middle_earth_shadow_of_war_keyart.jpg?itok=M0NHEKU5"/>
                        </div>
                        <div className="card-content">
                          <p>Middle Earth - Shadow of War</p>
                        </div>
                        <div className="card-action price">
                          <a href="#">$ 35.000</a>
                        </div>
                      </div>
                    </div>

                    <div className="col s12 m4 l3">
                      <div className="card small">
                        <div className="card-image">
                          <img src="http://www.mobygames.com/images/covers/l/368100-titanfall-2-xbox-one-front-cover.png"/>
                        </div>
                        <div className="card-content">
                          <p>Titanfall</p>
                        </div>
                        <div className="card-action price">
                          <a href="#">$ 35.000</a>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>

              </div>
            </div>
          </main>


          <footer className="grey page-footer">
            <div className="container">
              <div className="row">
                <div className="col s12">
<<<<<<< HEAD
                  <h5 className="white-text">Acerca de Banana Project</h5>
                  <ul id='credits'>
                    <li>
                      Nuestra misión es ayudar a los gamers a escoger el juego deseado al mejor precio!

                    </li>
                    <li>
                      Nos puedes encontrar en: <a href="https://facebook.com">Facebook</a>,<a href="https://twitter.com">Twitter</a>
=======
                  <h5 className="white-text">Icon Credits</h5>
                  <ul id='credits'>
                    <li>
                      Gif Logo made using <a href="http://formtypemaker.appspot.com/">Form Type Maker</a> from <a
                      href="https://github.com/romannurik/FORMTypeMaker">romannurik</a>
                    </li>
                    <li>
                      Icons made by <a href="https://material.io/icons/">Google</a>, available under <a
                      href="https://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache License Version 2.0</a>
>>>>>>> homepage
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div className="footer-copyright">
              <div className="container footer-style">
<<<<<<< HEAD
=======
                <span>Made By <a href="https://github.com/piedcipher" target="_blank">Tirth Patel</a></span>
>>>>>>> homepage
              </div>
            </div>
          </footer>

        </main>

      </div>
    );
  }
}

export default App;
