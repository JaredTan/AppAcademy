import React from 'react';
import { Route, Switch, Link} from 'react-router-dom';
import GreetingContainer from './greetings/greeting_container';
import SessionFormContainer from './session/session_form_container';
import { AuthRoute } from '../util/route_util.jsx';

const App = () => (
  <div>
    <Link to="/" className="header">
      <h1>The Best Benches one can find.</h1>
    </Link>

    <Switch>
      <AuthRoute path="/login" component={SessionFormContainer}/>
      <AuthRoute path="/signup" component={SessionFormContainer}/>
      <Route path="/" component={GreetingContainer}/>
    </Switch>
  </div>
);

export default App;
