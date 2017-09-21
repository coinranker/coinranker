var CoinRankerDishboard = React.createClass({
    getInitialState: function() {
        return { coin_rankers: [] };
    },

    componentDidMount: function() {
        this.getDataFromApi();
    },

    getDataFromApi: function() {
        var self = this;
        $.ajax({
            url: '/rankers',
            type: 'POST',
            success: function(data) {
                console.log("data test");
                console.log(data);
                self.setState({ coin_rankers: data });
            },
            error: function(xhr, status, error) {
                alert('Cannot get data from rankers: ', error);
            }
        });
    },

    render() {
        return (
            const { refreshClickHandler } = this.props;

            <div className="container">
                <div className="jumbotron">
                    <h1>코인랭커 메인</h1>
                    <p>by Jinsun</p>
                    <RefreshButton clickHandler = {refreshClickHandler} />
                </div>
                <div className="row">
                    <div className="col-md-12">
                        <CoinRankerTable coin_rankers={this.state.coin_rankers} />
                    </div>
                </div>
            </div>
        )
    }
});
