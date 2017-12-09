import React, {Component} from 'react';

import './Footer.css';

class Footer extends Component{
    render(){
        return(
            <footer className="grey page-footer">
            <div className="container">
            <div className="row">
                <div className="col s12">
                <h5 className="white-text">Acerca de Banana Project</h5>
                <ul id='credits'>
                    <li>
                    Nuestra misión es ayudar a los gamers a escoger el juego deseado al mejor precio!

                    </li>
                    <li>
                    Nos puedes encontrar en: <a href="https://facebook.com">Facebook</a>,<a href="https://twitter.com">Twitter</a>
                    </li>
                </ul>
                </div>
            </div>
            </div>
            <div className="footer-copyright">
            <div className="container footer-style">
            </div>
            </div>
            </footer>
        );
    }
 
}

export default Footer;

