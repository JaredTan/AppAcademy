import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      result: 0,
      num1: '',
      num2: ''
    };

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.multiply.bind(this);
    // your code here
  }

  setNum1(e) {
    const num1 = e.target.value ? parseInt(e.target.value) : '';
    this.setState({num1});
  }
  // your code here
  setNum2(e) {
    const num2 = e.target.value ? parseInt(e.target.value) : '';
    this.setState({num2});
  }

  add(e) {
    e.preventDefault;
    const result = this.state.num1 + this.state.num2;
    this.setState({result});
  }

  subtract(e) {
    e.preventDefault;
    const result = this.state.num1 - this.state.num2;
    this.setState({result});
  }

  multiply(e) {
    e.preventDefault;
    const result = this.state.num1 * this.state.num2;
    this.setState({result});
  }

  divide(e) {
    e.preventDefault;
    const result = this.state.num1 / this.state.num2;
    this.setState({result});
  }

  clear(e) {
    e.preventDefault;
    this.setState({num1 : '', num2 : '', result: 0});
  }

  render() {
    const {result, num1, num2} = this.state;
    return (
      <div>
        <h1>{this.state.result}</h1>

        <input onChange={this.setNum1} value ={num1}></input>
        <input onChange={this.setNum2} value ={num2}></input>
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>

      </div>
    );
  }
}

export default Calculator;
