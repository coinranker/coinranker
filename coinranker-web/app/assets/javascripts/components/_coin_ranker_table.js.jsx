var CoinRankerTable = React.createClass({
    render() {
        var coin_rankers = [];
        this.props.coin_rankers.forEach(function(coin_ranker) {
            coin_rankers.push(<CoinRanker coin_ranker={coin_ranker} key={'coin_ranker' + coin_ranker.id}/>);
        }.bind(this));

        return (
            const customEnterAnimation = {
                from: { transform: 'scale(0.5, 1)' },
                to:   { transform: 'scale(1, 1)' }
            };

            <FlipMove enterAnimation={customEnterAnimation}>
                {renderChildren()}
            </FlipMove>

            // <table className="table table-striped">
            //     <thead>
            //         <tr>
            //             <th className="col-md-8">Email</th>
            //             <th className="col-md-4">Exchange</th>
            //         </tr>
            //     </thead>
            //     <FlipMove typeName="tbody" className="row" duration={500} easing="ease-in-out">
            //         { coin_rankers }
            //     </FlipMove>
            // </table>
        )
    }
});