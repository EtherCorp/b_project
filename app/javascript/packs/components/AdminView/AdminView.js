import React, {Component} from 'react';

import './AdminView.css';
import {Icon, Input, Row} from "react-materialize";

class GameView extends Component {

  render() {
    return (
       <div className='row body-content'>
         <div className="card">

           <table className="striped">
             <thead>
               <tr>
                 <th>Módulo Scraping</th>
                 <th>Last Successful Scraping</th>
                 <th>Last Scraping Attempt</th>
                 <th>Estado</th>
               </tr>
             </thead>

             <tbody>
               <tr>
                 <td>Tienda-A</td>
                 <td>2017-12-08 23:12:43</td>
                 <td>2017-12-08 23:12:43</td>
                 <td>
                   <Input name='on' type='switch' value='0' disabled="disabled"/>
                 </td>
               </tr>
               <tr>
                 <td>Tienda-B</td>
                 <td>2017-12-08 21:23:23</td>
                 <td>2017-12-08 21:23:23</td>
                 <td>
                   <Input name='on' type='switch' value='0' disabled="disabled"/>
                 </td>
               </tr>
               <tr>
                 <td>Tienda-C</td>
                 <td>2017-12-08 23:12:25</td>
                 <td>2017-12-08 23:12:43</td>
                 <td>
                   <Input name='on' type='switch' value='0' disabled="disabled"/>
                 </td>
               </tr>
             </tbody>
           </table>

         </div>
         <div className="card">

           <table className="striped">
             <thead>
             <tr>
               <th>Módulo Scraping</th>
               <th>Severity</th>
               <th>Motivo</th>
               <th>Fecha</th>
             </tr>
             </thead>

             <tbody>
               <tr>
                 <td>Tienda-A</td>
                 <td><Icon small>error</Icon> High</td>
                 <td>Scraping Format Outdated</td>
                 <td>2017-12-08 23:12:43</td>
               </tr>
               <tr>
                 <td>Tienda-B</td>
                 <td><Icon small>warning</Icon> Normal</td>
                 <td>Store Page Server Down</td>
                 <td>2017-12-08 21:23:23</td>
               </tr>
             </tbody>
           </table>

         </div>
       </div>
    );
  }
}

export default GameView;