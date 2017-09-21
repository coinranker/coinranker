var CoinRanker = React.createClass({
    propTypes: {
        email: React.PropTypes.string,
        exchange: React.PropTypes.string
    },
    render() {
        var coin_ranker = this.props.coin_ranker;
        return(
            <tr>
                <td>{coin_ranker.email}</td>
                <td>{coin_ranker.exchange}</td>
            </tr>
        )
    }
});