import React from 'react';
import { HashRouter,BrowserRouter, Route, Switch, Link } from "react-router-dom";
import App from "./components/App";

import GameViewContainer from './containers/game-view-container'

export default () => {
 return (
   <HashRouter>
    <Switch>
      <Route exact path="/" component={App}/>
      <Route path="/games/:id" component={GameViewContainer}/>
      {/*<Route path="*" to="/" />*/}
    </Switch>
   </HashRouter>
 )
}