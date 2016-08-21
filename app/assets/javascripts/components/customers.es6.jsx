class Customers extends React.Component {
  render () {
    return (
      <div>
        {this.props.customers.map(function(customer){
          return(
            <p key={customer.id}> <a href={"/customers/" + customer.id}> {customer.name} </a> {customer.customercode} </p>
          )
        })}
      </div>
    )
  }
}
