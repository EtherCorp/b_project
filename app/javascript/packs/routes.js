import React from 'react';
import { BrowserRouter, Route, Switch, Link } from "react-router-dom";
import App from "./components/App";

import GameViewContainer from './containers/game-view-container'

export default () => {
 return (
   <BrowserRouter>
   <Switch>
   <Route exact path="/" component={App}/>
   <Route path="/games/:id" component={GameViewContainer}/>
   {/*<Route path="*" to="/" />*/}
   </Switch>
   </BrowserRouter>
 )
}