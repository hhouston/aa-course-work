import React from 'react';

class Counts extends React.Component {
  componentWillMount() { debugger }
  componentDidMount() { debugger }
  componentWillReceiveProps(nextProps) { debugger }
  componentWillUpdate(nextProps, nextState) { debugger }
  componentDidUpdate(prevProps, prevState) { debugger }
  componentWillUnmount() { debugger }

  render () {
    return (
      <ul>
        {
          this.props.previousCounts.map(count => <li>{count}</li>)
        }
      </ul>
    );
  }
}
// const Counts = ({previousCounts}) => (
//   // logic, calculations
//
//   <ul>
//     {
//       previousCounts.map((count, i) => <li key={i} data={count}>{count}</li>)
//     }
//   </ul>
//   // return(
//   //   //jsx
//   //
//   // )
// );
//implicit return style
// const Counts = (props) => (
//   // logic, calculations
//
//   <ul>
//     {
//       props.previousCounts.map(count => <li>{count}</li>)
//     }
//   </ul>
//   // return(
//   //   //jsx
//   //
//   // )
// );
export default Counts;
