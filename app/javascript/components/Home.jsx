import React from "react";
import { Link } from "react-router-dom";

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tickers: []
    };
  }

  componentDidMount() {
    const url = "/api/v1/tickers";
    fetch(url)
      .then(response => {
        if (response.ok) {
          console.log(response)
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ tickers: response }))
      .catch(() => this.props.history.push("/"));
  }
  render() {
    const { tickers } = this.state;
    const alltickers = tickers.map((ticker, index) => (
      <div key={index} className="col-md-6 col-lg-4">
        {ticker.symbol}<br/>
        {ticker.weightedAvgPrice} <br/>
        {ticker.priceChangePercent}%<br/>
        {ticker.bidPrice}<br/>
        {ticker.askPrice}
      </div>
    ));
    const noRecipe = (
      <div className="vw-100 vh-50 d-flex align-items-center justify-content-center">
        <h4>
          No tickers yet. Why not <Link to="/new_recipe">create one</Link>
        </h4>
      </div>
    );

    return (
      <>
        <div className="py-5">
          <main className="container">
            <div className="row">
              {tickers.length > 0 ? alltickers : noRecipe}
            </div>
          </main>
        </div>
      </>
    );
  }
}
export default Home;