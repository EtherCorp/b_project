import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './components/App';

import { createStore, applyMiddleware } from 'redux'
import { Provider } from 'react-redux';
import thunk from 'redux-thunk';
import registerServiceWorker from './registerServiceWorker';

import reducers from './reducers/reducers.js'
import AppRoutes from './routes';

const store = createStore(reducers,
  applyMiddleware(thunk))

//import createLogger from 'redux-logger';
//const logger = createLogger();

ReactDOM.render(
  <Provider store={store}>
    <AppRoutes />
  </Provider>,
  document.getElementById('root')
);
registerServiceWorker();
