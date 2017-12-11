function buildGameinit(){
    const state = [
			{id: 'play4', title:'play 4',
			imgPlatform:"https://logodownload.org/wp-content/uploads/2017/05/playstation-4-logo-ps4-8.png",
			cards: [
				{ title: 'My title',description: 'My description', price:"999", img:"#",url:"#" },
				{ title: 'My title 2',description: 'My description 2', price:"999", img:"#",url:"#" },
				{ title: 'My title 2',description: 'My description 2', price:"999", img:"#",url:"#" }
				]},
			{id: 'xone', title:'xbox one',
			imgPlatform:"https://cdn.worldvectorlogo.com/logos/xbox-one-3.svg",
			cards: [
			{ title: 'My title',description: 'My description', price:"999", img:"#",url:"#" },
			{ title: 'My title 2',description: 'My description 2', price:"999", img:"#",url:"#" },
			{ title: 'My title 2',description: 'My description 2', price:"999", img:"#",url:"#" }
			]},
			{id: 'nintendo', title:'nintendo',
			imgPlatform:"https://vignette3.wikia.nocookie.net/new-fantendo/images/5/5a/Nintendo_Switch_logo.png/revision/latest?cb=20161023110124&path-prefix=es",
			cards: [
				{ title: 'My title',description: 'My description', price:"999", img:"https://www.btgames.co.za/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/P/R/PR26253BI15617_N017112902011240_NS_SUPER_MARIO_ODYSSEY_SZ1.jpg",url:"#" },
				{ title: 'My title 2',description: 'My description 2', price:"999", img:"#",url:"#" },
				{ title: 'My title 2',description: 'My description 2', price:"999", img:"#",url:"#" }
				]}

		]
    return state;
}

export const gamesReducer = (state = [], action) => {
	switch (action.type) {
		case 'FETCH_GAMES_SUCCESS':
			return action.data;
		default:
			return state;
	}
}

export const gameReducer = (state = [], action) => {
	switch (action.type) {
		case 'FETCH_GAME_BY_ID_SUCCESS':
			return action.data;
		default:
			return state;
	}
}

export const isFetchingGames = (state = false, action) => {
    switch (action.type) {
      case 'REQ_DATA':
				return true;
			case 'FETCH_GAMES_SUCCESS':
				return false;
			case 'RECV_ERROR':
				return false;
      default:
        return state;
    }
}