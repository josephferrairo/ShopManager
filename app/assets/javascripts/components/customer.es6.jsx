class Customer extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      clicked: false
    }
  }
  render () {
    return (
      <div className="booyah-box ">
      <h2> {this.props.customer.name} </h2>
      <p> <b>Customer Code:</b> {this.props.customer.customercode} </p>
      <p> <b>Address:</b> {this.props.customer.address} </p>
      <p> <b>Address 2:</b> {this.props.customer.addressdetails} </p>
      <p> <b>City:</b> {this.props.customer.city} </p>
      <p><b>State:</b> {this.props.customer.state} </p>
      <p><b>Zipcode</b> {this.props.customer.zipcode} </p>
      </div>
    )
  }
}
