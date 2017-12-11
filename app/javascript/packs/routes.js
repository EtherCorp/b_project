import React from 'react';
import { BrowserRouter, Route, Switch, Link } from "react-router-dom";
import App from "./components/App";
import GameView from "./components/GameView/GameView";

export default () => {
 return (
   <BrowserRouter>
   <Switch>
   <Route exact path="/" component={App}/>
   <Route path="/games/:id" component={GameView}/>
   </Switch>
   </BrowserRouter>
 )
}