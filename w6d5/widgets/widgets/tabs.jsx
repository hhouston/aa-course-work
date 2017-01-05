import React from 'react';

class Headers extends React.Component {

  render() {

    let selected = this.props.selectedPane;
    let headers = this.props.panes.map((pane, i) => {
      let title = pane.title;
      let klass = '';

      if (selected === i) {
        klass = 'active';
      }

      return (
        <span
          key={i}
          onClick={this.props.onSelectTab.bind(null, i)}
          className={klass}
          >
          {title}{' '}
        </span>
      );
    });

    return(
      <div className='tab-header'>
        {headers}
      </div>
    );
  }
}


class Tabs extends React.Component {
  constructor(props) {
    super(props);

    this.state = { selectedPane: 0 };
  }

  selectTab(num) {
    this.setState({selectedPane: num});
  }


  render() {
    let pane = this.props.panes[this.state.selectedPane];

    return(
      <div>
        <h1>Tabs</h1>
        <div className="tabs">
          <Headers
            selectedPane={this.state.selectedPane}
            onSelectTab={this.selectTab.bind(this)}
            panes={this.props.panes}>
          </Headers>
          <div className="tab-content">
            <p>{pane.content}</p>
          </div>
        </div>
      </div>
    );
  }

}

export default Tabs;
