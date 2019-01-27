import React from 'react'
import Table from './Table'
import Form from './Form'

class Content extends React.Component {
  render() {
    return (
      <div>
        <p>Account: {this.props.account}</p>
        <Table candidates={this.props.candidates} />
        <hr/>
        { !this.props.hasVoted ?
          <Form candidates={this.props.candidates} castVote={this.props.castVote} />
          : null
        }
      </div>
    )
  }
}

export default Content
