import React, { Component } from 'react';
import './App.css';

import {Navbar,NavItem,Icon,Footer,Input,MenuItem} from 'react-materialize';


class App extends Component {
  render() {
    return (
      <div className="App">
        <Navbar brand='Banana Project' right className="App-navbar">
        <MenuItem href="#">
        <Input s={6} validate><Icon>search</Icon></Input>
        </MenuItem>
        <NavItem href='get-started.html'><Icon>view_module</Icon></NavItem>
        <NavItem href='get-started.html'><Icon>refresh</Icon></NavItem>
        <NavItem href='get-started.html'><Icon>more_vert</Icon></NavItem>
        </Navbar>

        BODY
        <Footer className="App-footer" copyrights="&copy 2015 Copyright Text"
        moreLinks={
          <a className="grey-text text-lighten-4 right" href="#!">More Links</a>
          }
          links={
            <ul>
              <li><a className="grey-text text-lighten-3" href="#!">Link 1</a></li>
              <li><a className="grey-text text-lighten-3" href="#!">Link 2</a></li>
              <li><a className="grey-text text-lighten-3" href="#!">Link 3</a></li>
              <li><a className="grey-text text-lighten-3" href="#!">Link 4</a></li>
            </ul>
          }

          >
              <h5 className="white-text">Footer Content</h5>
              <p className="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
          </Footer>;
      </div>
    );
  }
}

export default App;
